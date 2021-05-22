<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Message;
use App\Events\MessageEvent;

class MessageController extends Controller
{

    /**
     * Metodo responsável por gravar a mensagem.
     */
    public function save(Request $request)
    {
        if(Message::create($request->all())){
            broadcast(new MessageEvent())->toOthers();
            return response()->json(array('status'=>1));
        }

        return response()->json(array('status'=>0,'message'=>'Não foi possível enviar a mensagem'));
    }
}
