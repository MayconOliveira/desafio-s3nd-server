<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Conversation extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id','support_id','status'
    ];

    protected $appends = ['messages'];

    public function getUserIdAttribute($value)
    {
        $user = User::where(['id'=>$value])->select('id','name','email')->get()->toArray();
        return $user[0];
    }

    public function getSupportIdAttribute($value)
    {
        $user = User::where(['id'=>$value])->select('id','name','email')->get()->toArray();
        return $user[0];
    }

    public function getMessagesAttribute()
    {
        $attributos = $this->getAttributes();
        return  Message::where(['conversation'=>$attributos['id']])->get()->toArray();
    }
}
