<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Cabana extends Model
{
    use HasFactory,SoftDeletes;
    protected $table='cabanas';
    protected $primaryKey = 'id';
    protected $keyType = 'integer';
    public $timestamps =false;
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
