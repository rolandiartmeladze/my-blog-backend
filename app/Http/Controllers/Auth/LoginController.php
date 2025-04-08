<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Support\Facades\Hash;


class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    public function login(Request $request)
    {
        // მოთხოვნის ვალიდაცია
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        // მომხმარებლის მოძებნა
        $user = User::where('email', $request->email)->first();

        if ($user && Hash::check($request->password, $user->password)) {
            // შექმენი Sanctum ტოკენი
            $token = $user->createToken('MyApp')->plainTextToken;

            // დაბრუნე ტოკენი
            return response()->json(['token' => $token]);
        }

        // თუ ვერ მოიძებნა მომხმარებელი ან პაროლი არასწორია
        return response()->json(['error' => 'Unauthorized'], 401);
    } 
    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
        $this->middleware('auth')->only('logout');
    }
}
