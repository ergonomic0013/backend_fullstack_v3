<?php
namespace Model;
use App;
use Exception;
use stdClass;
use System\Emerald\Emerald_model;

/**
 * Created by PhpStorm.
 * User: mr.incognito
 * Date: 27.01.2020
 * Time: 10:10
 */
class Post_comment_model extends Emerald_Model
{
    const CLASS_TABLE = 'post_comment';


    /** @var int */
    protected $post_id;
    /** @var int */
    protected $comment_id;

    function __construct($id = NULL)
    {
        parent::__construct();
        $this->set_id($id);
    }

    /**
     * @param int $id
     * @return bool
     * @throws \ShadowIgniterException
     */
    public function set_post_id(int $id):bool
    {
        $this->post_id = $id;
        return $this->save('post_id', $id);
    }

      /**
     * @param int $id
     * @return bool
     * @throws \ShadowIgniterException
     */
    public function set_comment_id(int $id):bool
    {
        $this->comment_id = $id;
        return $this->save('comment_id', $id);
    }



    // generated

    /**
     * @return Comment_model[]
     */
    public function get_comments():array
    {
       //TODO
    }

    /**
     * @return Post_model[]
     */
    public function get_posts():array
    {
       //TODO
    }

    public function reload()
    {
        parent::reload();
        return $this;
    }

    public static function create(array $data)
    {
        App::get_s()->from(self::CLASS_TABLE)->insert($data)->execute();
        return new static(App::get_s()->get_insert_id());
    }

    public function delete()
    {
        $this->is_loaded(TRUE);
        App::get_s()->from(self::CLASS_TABLE)->where(['id' => $this->get_id()])->delete()->execute();
        return App::get_s()->is_affected();
    }

    /**
     * @return static[]
     * @throws Exception
     */
    public static function get_all():array
    {
        return static::transform_many(App::get_s()->from(self::CLASS_TABLE)->many());
    }

    /**
     * @param Post_model $data
     * @param string $preparation
     * @return stdClass
     * @throws Exception
     */
    public static function preparation(Post_model $data, $preparation = 'default'):stdClass
    {
        switch ($preparation)
        {
            case 'default':
                return self::_preparation_default($data);
            case 'full_info':
                return self::_preparation_full_info($data);
            default:
                throw new Exception('undefined preparation type');
        }
    }

    /**
     * @param Post_model $data
     * @return stdClass
     */
    private static function _preparation_default(Post_model  $data):stdClass
    {
        $o = new stdClass();

        $o->id = $data->get_id();
        $o->img = $data->get_img();

        $o->text = $data->get_text();

        $o->user = User_model::preparation($data->get_user(), 'main_page');

        $o->time_created = $data->get_time_created();
        $o->time_updated = $data->get_time_updated();

        return $o;
    }


    /**
     * @param Post_model $data
     * @return stdClass
     */
    private static function _preparation_full_info(Post_model $data):stdClass
    {
        $o = new stdClass();


        $o->id = $data->get_id();
        $o->img = $data->get_img();

        $o->user = User_model::preparation($data->get_user(),'main_page');
        $o->coments = Comment_model::preparation_many($data->get_comments(),'default');

        $o->likes = $data->get_likes();


        $o->time_created = $data->get_time_created();
        $o->time_updated = $data->get_time_updated();

        return $o;
    }
}
