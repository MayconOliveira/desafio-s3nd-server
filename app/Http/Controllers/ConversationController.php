<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Conversation;
use App\Models\User;

class ConversationController extends Controller
{

    /**
     * Método responsável por inciar uma conversar com o atendente
     */
    public function init()
    {
        if(auth()->user()->support == 0){
            $conversation = Conversation::where(['status'=> 1])->get()->toArray();

            if(sizeof($conversation) > 0){
                return response()->json(array('status'=>0,'message'=>'O suporte está em atendimento, aguarde sua vez.'));
            }

            $support = User::where(['support'=>1])->first();

            $conversation = Conversation::create(['status'=>1,'user_id'=>auth()->user()->id,'support_id'=>$support->id]);

            if($conversation){
                return response()->json(array('status'=>1));
            }
        }

        return response()->json(array('status'=> 0,'message'=>"Aguardando um cliente para atendimento"));
    }

    /**
     * Método responsável por encerrar o antendimento
     * Como regra somente o atendente pode encerrar o atendimento.
     */
    public function shutDown($id)
    {
        if(auth()->user()->support == 1){
            $conversation = Conversation::where(['id'=>$id,'status'=>1])->get()->toArray();

            if(sizeof($conversation) > 0){
                if(Conversation::where(['id'=>$id,'status'=>1])->update(['status'=>0])){
                    return response()->json(array('status'=>1,'message'=>'O atendimento foi encerrado com sucesso.'));
                }
            }
        }

        return response()->json($id);
    }

    /**
     * Método responsável por buscar as conversas para em andamento para o usuário logado.
     */
    public function index()
    {
        $where['status'] = 1 ;

        if(auth()->user()->support == 1){
            $where['support_id'] = auth()->user()->id;
        }else{
            $where['user_id'] = auth()->user()->id;
        }

        $conversation = Conversation::where($where)->get()->toArray();

        return response()->json($conversation[0]);
    }
}
