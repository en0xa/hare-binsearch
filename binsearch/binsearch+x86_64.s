.section .text.binsearch.binsearch64
.global binsearch.binsearch64
.type binsearch.binsearch64,@function
binsearch.binsearch64:
        // Input params
        // %rdi - pointer to the array
        // %rsi - value we're looking for
        // %rdx - array length
        push %rdi

        shl $3,%rdx   /* length in bytes (count*8) */
        add %rdi,%rdx  /* length elements by 8 bytes */

        mov %rdi,%rax

_binsearch64._loop:
        // check the bounds
        // if less or equal we've found the element
        cmp %rdi,%rdx
        jle _binsearch64._exit

        // calc the center offset
        mov %rdx,%rax
        add %rdi,%rax
        shr $1,%rax
        and $0xfffffffffffffff8,%rax

        cmp %rsi,(%rax)
        jg _binsearch64._right
        cmp %rsi,(%rax)
        je _binsearch64._exit

_binsearch64._left:
        add $8,%rax
        mov %rax,%rdi
        jmp _binsearch64._loop

_binsearch64._right:
        // move right bound
        mov %rax,%rdx
        jmp _binsearch64._loop

_binsearch64._exit:
        pop %rdi
        // substract the beginning of the area from current left pointer
        sub %rdi,%rax
        // calc the index, divide by 8 bytes
        shr $3,%rax

        retq
