#ifndef __HUFFMANTREEE_H__
#define __HUFFMANTREEE_H__



#define NODE_TYPE_LEAF              (0x00)
#define NODE_TYPE_INTERMEDIATE      (0x01)

#define CHILD_TYPE_ROOT             (0x00)
#define CHILD_TYPE_LEFT             (0x01)
#define CHILD_TYPE_RIGHT            (0x02)

template<typename T>   /* float or double*/
class Ht_Node
{   
    private:
        
        T               m_probability     ;   /*    概率                                                         */
        Ht_Node<T>*     m_left            ;   /*    左孩子                                                       */
        Ht_Node<T>*     m_right           ;   /*    右孩子                                                       */    
        int             m_node_type       ;   /*    0:叶子节点(终端节点),1:非叶子节点(中间节点)                  */
        int             m_child_type      ;   /*    0:根节点,1:是别的节点的左孩子,2:是别的节点的右孩子           */
        
    public:
    
        Ht_Node()
        {
            this->m_probability     =   (T)(0.0)            ;
            this->m_left            =   NULL                ;
            this->m_right           =   NULL                ;
            this->m_node_type       =   NODE_TYPE_LEAF      ;
            this->m_child_type      =   CHILD_TYPE_ROOT     ;
        }
        
        Ht_Node(T proba)
        {
            this->m_probability     =   proba               ;
            this->m_left            =   NULL                ;
            this->m_right           =   NULL                ;
            this->m_node_type       =   NODE_TYPE_LEAF      ;
            this->m_child_type      =   CHILD_TYPE_ROOT     ;            
        }


        /*
            设置当前对象的左孩子节点
        */
        void setLeftNode(Ht_Node<T>* node)
        {
            /*
                设置为其他节点
            */
            if(node)
            {
                this->m_left = node;
                node->setNodeType(CHILD_TYPE_LEFT);
            }
            /*
                设置为NULL
            */
            else
            {
                if(this->m_left)
                {
                    this->m_left->setNodeType(CHILD_TYPE_ROOT);
                    this->m_left = NULL;
                }
            }
        }
        
        /*
            设置当前对象的右孩子节点
        */
        void setRightNode(Ht_Node<T>* node)
        {
            if(node)
            {
                this->m_right = node;
                node->setNodeType(CHILD_TYPE_RIGHT);                 
            }
            else
            {
                if(this->m_right)
                {
                    this->m_right->setNodeType(CHILD_TYPE_ROOT);
                    this->m_right = NULL;
                }
            }
        }

        /*
            设置当前节点的概率值
        */
        void setProbability(T proba)
        {
            this->probability = prob;
        }
        
        /*
            设置当前节点类型,
        */
        void setNodeType(int node_type)
        {
            this->node_type = node_type;
        }


        /*
            获取当前节点类型,是否为: 叶子节点(0) , 中间节点(1)  
        */
        int getNodeType(void)
        {
            return this->m_node_type;
        }
        
        /*
            获取当前节点的子节点类型,是否是根节点或其他结点的左孩子、右孩子
        */
        int getChildType(void)
        {
            return this->m_child_type;
        }
        
        /*
            获取当前节点的概率
        */
        T getProbability(void)
        {
            return this->m_probability;
        }

};



template<typename T>   /* float or double*/
class HuffmanTree
{
    private:
        T*              m_probabilities     ;
        int             m_tree_size         ;
        Ht_Node<T>*     m_tree_root         ;
        
        
        
        void destroyTree(Ht_Node<T>* node)
        {
            if(node)
            {
                destroyTree(node->left);
                destroyTree(node->right);
                delete node;
            }
        }
        
    public:
        HuffmanTree(T* proba_buf, int buf_size)
        {
            this->m_probabilities       =   proba_buf   ;
            this->m_tree_size           =   tree_size   ;
            
            /*1.生成 m_tree_size 个叶子节点 */
            Ht_Node<T>*  hnt = new Ht_Node<T>[tree_size];   /*默认都是叶子节点*/
            for(int i = 0 ; i < tree_size ; i++)
            {
                hnt[i].setProbability(proba_buf[i]);
            }
            
            /*2.*/
            
        }
        
        
        

        
        ~HuffmanTree()
        {
            destroyTree(this->m_tree_root);
        }
        
        
        
};



class HuffmanCoding
{
    
};










#endif /* !__HUFFMANTREEE_H__ */