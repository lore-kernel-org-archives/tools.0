Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C2D7497
	for <tools@linux.kernel.org>; Wed, 20 Jul 2022 23:41:18 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id r6so252250edd.7
        for <tools@linux.kernel.org>; Wed, 20 Jul 2022 16:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S5uxfcz63P0/wkjT1Vb9bAi7ah0Vn6sDs6cvpMISAIc=;
        b=ahEp/lOjaijTecK64rcXUA8uOrWVdXkRIV2hx7CUcj0LK5zZc02gCWkW1E/4xIgaQG
         FMlns6LCi7nFjycpQqQ3hyJ9CZ9gBACx2+Oc42hya4yixri4g8at7K3SUNjV56o4In26
         Soe7hrZmqijFyhl3jeTlInspqReMY3r2WL4Bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S5uxfcz63P0/wkjT1Vb9bAi7ah0Vn6sDs6cvpMISAIc=;
        b=x4nDmS4w3A/O1ZYZQRdlWmBacim3Er97eXC4xdSDr8bZMWK/2G02ZkrKTScMR28yNW
         82VaezzLFUs5k+zvH1N5pI7wRtLEDRGEsl2q4odAdfyWJNaHqVPtL2QAs24u9Z5RukAC
         aLzN5Y7Q3PEztJMXV4PnyDQQ6EGUmwdIRfutJeFJPa8AxTRHUhL9+u6e/icUj4urp9+6
         G1pKWSqRwPiF4DdOScwRiumCdvHLdXeeo39kSx1GO1Eah+0kt3KYdlg17du5UsHToIGt
         TblpBUKGTuTReGsiKYQ8mhs6InpD/bth0BJ9TM0uTfJYpUV096IEDelMzJ7Dp4UdVUHX
         4JtQ==
X-Gm-Message-State: AJIora/DDwu/YrBFTUwP7VDPWEhdtfyLlYd0qfmWqp2P/LgxO/9IoefT
	fT6T3SH6QGs+U79v/KEW+FfLknA1PKk0PExfRzw=
X-Google-Smtp-Source: AGRyM1tkk7pLcVedrqtGXFmhkvANaztxcsJrnIAicTByyoJGumdwrb3cXKx5GTKynficcV0FjBwi7Q==
X-Received: by 2002:a05:6402:354a:b0:43a:d32f:cc62 with SMTP id f10-20020a056402354a00b0043ad32fcc62mr52394659edd.48.1658360476643;
        Wed, 20 Jul 2022 16:41:16 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id bd9-20020a056402206900b0043a09f6fc24sm174782edb.47.2022.07.20.16.41.15
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 16:41:15 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id b6so118516wmq.5
        for <tools@linux.kernel.org>; Wed, 20 Jul 2022 16:41:15 -0700 (PDT)
X-Received: by 2002:a05:600c:2d07:b0:3a3:585:5d96 with SMTP id
 x7-20020a05600c2d0700b003a305855d96mr5908467wmf.38.1658360475148; Wed, 20 Jul
 2022 16:41:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local> <20220720184835.uhnkucai54alhgo6@nitro.local>
 <20220720192456.GM5049@ziepe.ca> <xmqqmtd31ip8.fsf@gitster.g>
 <CAHk-=wgWY5920sr5AUxZVP6hs85wiTzR0AMH9pc5epfzTeC3wA@mail.gmail.com> <20220720233940.GO5049@ziepe.ca>
In-Reply-To: <20220720233940.GO5049@ziepe.ca>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 20 Jul 2022 16:40:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgEmH89HpOB5ZYO9owwZ67=O6cikbre2-PShM+AsXhYcg@mail.gmail.com>
Message-ID: <CAHk-=wgEmH89HpOB5ZYO9owwZ67=O6cikbre2-PShM+AsXhYcg@mail.gmail.com>
Subject: Re: b4 submit ready for beta testing
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Junio C Hamano <gitster@pobox.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@linux.kernel.org, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 20, 2022 at 4:39 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> If the cover letter is the last commit then 'git commit --amend'
> allows editing it as easily as 'git branch --edit description'.

.. and what about adding new commits during development?

That sounds oh-so-*very* inconvenient.

               Linus
