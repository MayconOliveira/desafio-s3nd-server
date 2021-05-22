<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $user = User::where(['email'=> $request->email])->first();

        if(!is_object($user)){
            User::create(array('name'=> $request->name,'email'=> $request->email));
            $user = User::where(['email'=> $request->email])->first();
        }

        $tokenResult = $user->createToken('Personal Access Token');

        $token = $tokenResult->token;

        $token->save();

        $oauth = DB::connection('mysql')->select("SELECT * FROM oauth_access_tokens  WHERE `revoked` = 0  AND user_id = ".$user->id);

        if(sizeof($oauth) > 0){
            DB::connection('mysql')->table('oauth_access_tokens')
            ->where('user_id', $user->id)
            ->update(['revoked' => 1]);
        }

        User::where(['id'=> $user->id])->update(['api_token'=> $tokenResult->accessToken]);

        return response()->json([
            'access_token' => $tokenResult->accessToken,
            'token_type' => 'Bearer',
            'expires_at' => Carbon::parse(
                $tokenResult->token->expires_at
            )->toDateTimeString(),
            'support'=>$user->support,
            'id'=> $user->id
        ]);
    }

    public function check()
    {
        return true;
    }
}
