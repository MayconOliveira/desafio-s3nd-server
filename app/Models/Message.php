<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    use HasFactory;


    protected $fillable = [
        'user','conversation','description'
    ];

    public function getUserAttribute($value)
    {
        $user = User::where(['id'=>$value])->select('id','name','email')->get()->toArray();
        return $user[0];
    }
}
