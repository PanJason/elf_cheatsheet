char* str = "hello world!\n";

void print(){
    asm("movl $13, %%edx \n\t"
        "movq %0, %%rcx \n\t"
        "movl $0, %%ebx \n\t"
        "movl $4, %%eax \n\t"
        "int $0x80  \n\t"
        ::"r"(str): "rdx", "rcx", "rbx");
}

void exit(){
    asm("movl $42, %ebx  \n\t"
            "movl $1, %eax \n\t"
            "int $0x80  \n\t");
}

void nomain(){
    print();
    exit();
}
