<?php

use Model\Boosterpack_model;
use Model\Post_model;
use Model\User_model;
use Model\Login_model;
use Model\Comment_model;
use Model\Post_comment_model;

/**
 * Created by PhpStorm.
 * User: mr.incognito
 * Date: 10.11.2018
 * Time: 21:36
 */
class Main_page extends MY_Controller
{
    const NOT_AUTH_METHODS  = [
            'login',
            'get_post',
            'index',
            'get_all_posts',
            'buy_boosterpack',
            'like_comment',
            'like_post',
            'get_boosterpack_info',
        ];

    public function __construct()
    {
        parent::__construct();

        $this->checkAuth();

        if (is_prod())
        {
            die('In production it will be hard to debug! Run as development environment!');
        }
    }

    public function checkAuth()
    {
        if (!in_array($this->router->method, [self::NOT_AUTH_METHODS]) && !User_model::is_logged()) {
            // каждый раз генерируется новая сессия, должно быть чтоб по ключу "my_session" обращалось к уже существующей

//            return $this->response_error(
//                'Access denied',
//                [
//                    'message' => 'Wrong name or password',
//                ],
//                401
//            );
        }
    }

    public function index()
    {
        $user = User_model::get_user();

        App::get_ci()->load->view('main_page', ['user' => User_model::preparation($user, 'default')]);
    }

    public function get_all_posts()
    {
        $posts =  Post_model::preparation_many(Post_model::get_all(), 'default');
        return $this->response_success(['posts' => $posts]);
    }

    public function get_boosterpacks()
    {
        $posts =  Boosterpack_model::preparation_many(Boosterpack_model::get_all(), 'default');
        return $this->response_success(['boosterpacks' => $posts]);
    }

    public function get_post(int $post_id)
    {
        $post = (new Post_model)->set_id($post_id);
        return $this->response_success(['data' => Post_model::preparation($post)]);
    }


    public function comment()
    {
        $postId = App::get_ci()->input->post('post_id');
        $replyId = App::get_ci()->input->post('reply_id');
        $assignId = App::get_ci()->input->post('assign_id');
        $text = App::get_ci()->input->post('text');
        $userId = User_model::get_session_id();

        try {
            $comment = Comment_model::create([
                'user_id' => $userId,
                'assign_id' => $assignId,
                'reply_id' => $replyId,
                'text' => $text,
            ]);

            if (!$comment->is_loaded()) throw new Exception();

            Post_comment_model::create(['comment_id' => $comment->get_id(), 'post_id' => $postId]);
            return $this->response_success([
                'data' => Comment_model::preparation($comment),
            ]);
        } catch (Throwable $exception) {
            throw new Exception('Something went wrong');
        }

    }


    public function login()
    {
        $email = filter_var(App::get_ci()->input->post('login'), FILTER_VALIDATE_EMAIL);
        $password = App::get_ci()->input->post('password');

        try {
            $model = Login_model::login($email, $password);
            $response = User_model::preparation($model);
        } catch (\Throwable $exception) {

            return $this->response_error(
                'Wrong credentials',
                [
                    'message' => 'Wrong name or password',
                ],
                401
            );
        }

        return $this->response_success((array) $response);
    }


    public function logout()
    {
        //TODO
    }

    public function add_money(){

        $sum = (float)App::get_ci()->input->post('sum');

        //TODO логика добавления денег
    }

    public function buy_boosterpack()
    {

        //TODO логика покупки и открытия бустерпака по алгоритмку профитбанк, как описано в ТЗ
    }


    /**
     *
     * @return object|string|void
     */
    public function like_comment(int $comment_id)
    {


        //TODO логика like comment(remove like у юзерa, добавить лай к комменту)
    }

    /**
     * @param int $post_id
     *
     * @return object|string|void
     */
    public function like_post(int $post_id)
    {

        //TODO логика like post(remove like у юзерa, добавить лай к посту)
    }


    /**
     * @return object|string|void
     */
    public function get_boosterpack_info(int $bootserpack_info)
    {


        //TODO получить содержимое бустерпак
    }
}
