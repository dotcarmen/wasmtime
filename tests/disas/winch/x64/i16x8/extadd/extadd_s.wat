;;! target = "x86_64"
;;! test = "winch"
;;! flags = [ "-Ccranelift-has-avx" ]

(module
  (func (param v128) (result v128)
        (local.get 0)
        (i16x8.extadd_pairwise_i8x16_s)
        ))
;; wasm[0]::function[0]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       movq    8(%rdi), %r11
;;       movq    0x10(%r11), %r11
;;       addq    $0x20, %r11
;;       cmpq    %rsp, %r11
;;       ja      0x51
;;   1c: movq    %rdi, %r14
;;       subq    $0x20, %rsp
;;       movq    %rdi, 0x18(%rsp)
;;       movq    %rsi, 0x10(%rsp)
;;       movdqu  %xmm0, (%rsp)
;;       movdqu  (%rsp), %xmm0
;;       vpmovsxbw %xmm0, %xmm15
;;       vpalignr $8, %xmm0, %xmm0, %xmm0
;;       vpmovsxbw %xmm0, %xmm0
;;       vpaddw  %xmm0, %xmm0, %xmm0
;;       addq    $0x20, %rsp
;;       popq    %rbp
;;       retq
;;   51: ud2
