.text
  .globl print
  .globl builtin_error
  .globl code_entry_point

code_entry_point:
/* put input on stack */
  movq %rdi, -8(%rsp)
/* store heap pointer in rbx */
  movq %rsi, %rbx
  addq $8, %rbx
  andq $-4, %rbx
/* begin program */
  movq $7, %rax
  movq %rax, -16(%rsp)
  movq $3, %rax
  movq %rax, -24(%rsp)
  movq $5, %rax
  movq %rax, -32(%rsp)
  movq $3, %rax
  movq %rax, -40(%rsp)
  movq $7, %rax
  movq %rax, -48(%rsp)
  movq -40(%rsp), %rax
  movq %rax, 0(%rbx)
  movq -48(%rsp), %rax
  movq %rax, 8(%rbx)
  movq %rbx, %rax
  addq $16, %rbx
  movq %rax, -40(%rsp)
  movq -16(%rsp), %rax
  movq %rax, 0(%rbx)
  movq -24(%rsp), %rax
  movq %rax, 8(%rbx)
  movq -32(%rsp), %rax
  movq %rax, 16(%rbx)
  movq -40(%rsp), %rax
  movq %rax, 24(%rbx)
  movq %rbx, %rax
  addq $32, %rbx
  movq %rax, -16(%rsp)
  andq $0x3, %rax
  cmp $0x0, %rax
  jne not_tuple1
  movq $7, %rax
  movq %rax, -24(%rsp)
  movq $3, %rax
  movq %rax, -32(%rsp)
  movq $5, %rax
  movq %rax, -40(%rsp)
  movq $3, %rax
  movq %rax, -48(%rsp)
  movq $9, %rax
  movq %rax, -56(%rsp)
  movq -48(%rsp), %rax
  movq %rax, 0(%rbx)
  movq -56(%rsp), %rax
  movq %rax, 8(%rbx)
  movq %rbx, %rax
  addq $16, %rbx
  movq %rax, -48(%rsp)
  movq -24(%rsp), %rax
  movq %rax, 0(%rbx)
  movq -32(%rsp), %rax
  movq %rax, 8(%rbx)
  movq -40(%rsp), %rax
  movq %rax, 16(%rbx)
  movq -48(%rsp), %rax
  movq %rax, 24(%rbx)
  movq %rbx, %rax
  addq $32, %rbx
  movq %rax, -24(%rsp)
  andq $0x3, %rax
  cmp $0x0, %rax
  je tuple_check2
  subq $16, %rsp
  movq $-10, %rdi
  call builtin_error
  addq $16, %rsp
tuple_check2:
  movq -16(%rsp), %rdi
  movq -24(%rsp), %rsi
  subq $16, %rsp
  call tuple_comparison
  addq $16, %rsp
  jmp end_sequiv3
not_tuple1:
  movq $7, %rax
  movq %rax, -16(%rsp)
  movq $3, %rax
  movq %rax, -24(%rsp)
  movq $5, %rax
  movq %rax, -32(%rsp)
  movq $3, %rax
  movq %rax, -40(%rsp)
  movq $7, %rax
  movq %rax, -48(%rsp)
  movq -40(%rsp), %rax
  movq %rax, 0(%rbx)
  movq -48(%rsp), %rax
  movq %rax, 8(%rbx)
  movq %rbx, %rax
  addq $16, %rbx
  movq %rax, -40(%rsp)
  movq -16(%rsp), %rax
  movq %rax, 0(%rbx)
  movq -24(%rsp), %rax
  movq %rax, 8(%rbx)
  movq -32(%rsp), %rax
  movq %rax, 16(%rbx)
  movq -40(%rsp), %rax
  movq %rax, 24(%rbx)
  movq %rbx, %rax
  addq $32, %rbx
  movq %rax, -16(%rsp)
  movq $7, %rax
  movq %rax, -24(%rsp)
  movq $3, %rax
  movq %rax, -32(%rsp)
  movq $5, %rax
  movq %rax, -40(%rsp)
  movq $3, %rax
  movq %rax, -48(%rsp)
  movq $9, %rax
  movq %rax, -56(%rsp)
  movq -48(%rsp), %rax
  movq %rax, 0(%rbx)
  movq -56(%rsp), %rax
  movq %rax, 8(%rbx)
  movq %rbx, %rax
  addq $16, %rbx
  movq %rax, -48(%rsp)
  movq -24(%rsp), %rax
  movq %rax, 0(%rbx)
  movq -32(%rsp), %rax
  movq %rax, 8(%rbx)
  movq -40(%rsp), %rax
  movq %rax, 16(%rbx)
  movq -48(%rsp), %rax
  movq %rax, 24(%rbx)
  movq %rbx, %rax
  addq $32, %rbx
  movq %rax, -24(%rsp)
  movq -16(%rsp), %rax
  movq %rax, %r10
  movq -24(%rsp), %r11
  andq $0x1, %r10
  cmp $0x1, %r10
  jne l_bool8
  andq $0x1, %r11
  cmp $0x1, %r11
  je l_end7
  jmp not_same6
l_bool8:
  movq %rax, %r10
  andq $0x3, %r10
  cmp $0x2, %r10
  jne l_tup9
  andq $0x3, %r11
  cmp $0x2, %r11
  je l_end7
  jmp not_same6
l_tup9:
  andq $0x3, %r11
  cmp $0x0, %r11
  je l_end7
not_same6:
  subq $16, %rsp
  movq $-8, %rdi
  call builtin_error
  addq $16, %rsp
l_end7:
  cmp -24(%rsp), %rax
  jne false_branch4
  movq $0x6, %rax
  jmp end_of_cmp5
false_branch4:
  movq $0x2, %rax
end_of_cmp5:
end_sequiv3:
  retq

