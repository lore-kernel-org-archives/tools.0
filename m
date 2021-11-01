Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE6E2C85;
	Mon,  1 Nov 2021 18:10:17 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id q127so21584044iod.12;
        Mon, 01 Nov 2021 11:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SAJzdaoUTORRqcynFaWf69ivxqW7tUcAhg8FKxvGcRg=;
        b=Ut6clA+GldAkCKbyzXnHOm0gdhEcPFLnvirkxXHsMuo8zH3W2z1QYt5bhtnVySfqZ7
         TYu2Mpc1t0GwP6AMTpckRl5oDRgHQ1JRIB6i+EM5gt62GqvN8dMIOCbazDCHbeLN9zN6
         /CZ1WeopPEfUAO6PpJOSQycRu3S4CyZ/vSpNtxDCOmkFAerd3Zj2U86JkYCUThPWe42S
         2X4g+UBTodUnMWrrgSv3MZbHvss9TQrPep3V8BTOfJMV0uToujbWKHq0HFdp+GiuaspC
         Hq7dm34G5DkTzeWjR3/qKrgmnooqt05tZ3SNWujNRoR5zYANoivxqQELsmHpzudM7JEJ
         ygrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SAJzdaoUTORRqcynFaWf69ivxqW7tUcAhg8FKxvGcRg=;
        b=OwIXZaw/D4CfNzIsrP+6Oq7TYTSjZomIJoXhnbgLV5QjtPLUCyuPG2t1kVejiq45kh
         XbE2bls648KM2M38+TaGsZQEskw+kWcGp2iVYvZasXTMc209ssP46PCKBblKw0gkg19a
         kJZcZqZhwy5ytlvM8VvxJitEIwHaKay+LdiHF1o6Ilk5fgXDNVep0DCGPazAitxUw07J
         irwNiq43BR8BOU6FJ15xBqmH63a/TUULgqEfAkZ3IBj4GLeCQQudgxl0y0FplE2uLsCC
         HsYQPSzHrB9U1VZ23DoPmU1ikuDmfs7+L4npqbpf4Xc/GLjYosLetLH8dFIjOjmBi5Ds
         OCpg==
X-Gm-Message-State: AOAM531sF0eG63wP6SvIdu4YQ6OmHriqse3fM5s0+jVc3z4hPvoMfF6E
	BhzyQ+zEsco8LRmMtTj1TFQJ828kuSZPAsTeZ4g=
X-Google-Smtp-Source: ABdhPJwGFe8TawhgrQlN/EN/aJUNFlweoQrhO1PYCuYSgNd/dmtcpQThTCCcV1TBeRlJwJj7rFPW8IcVuuwU22tKXIs=
X-Received: by 2002:a5d:8903:: with SMTP id b3mr22724561ion.44.1635790216756;
 Mon, 01 Nov 2021 11:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20211101175020.5r4cwmy4qppi7dis@meerkat.local>
In-Reply-To: <20211101175020.5r4cwmy4qppi7dis@meerkat.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Nov 2021 19:10:05 +0100
Message-ID: <CANiq72k-n-u9nQAzE1yUPz-ioF+coas_rBOofyuJnBgdvTZ2Yw@mail.gmail.com>
Subject: Re: b4: unicode control characters -- warn or remove?
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 1, 2021 at 6:50 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Per exhibit a, what should we do in the situation where we discover unicode
> control characters in an email?
>
> 1. Warn and strip these chars out, because they are extremely unlikely to be
>    doing anything legitimate in the context of a patch (unless someone is
>    sending patches for docs actually written in RTL languages)
> 2. Warn and error out, refusing to produce an mbox
> 3. Just warn and produce an mbox anyway

I think option #2 would be the best + a flag to override the error (to
be used if the user has verified it is legitimate).

Cheers,
Miguel
