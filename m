Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A09479F1
	for <tools@linux.kernel.org>; Wed,  2 Aug 2023 14:11:44 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-63d4b5890a0so35993846d6.2
        for <tools@linux.kernel.org>; Wed, 02 Aug 2023 07:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690985504; x=1691590304;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kf80teLEbPHcRdOUL6lRjhfpJhOugqIup/sh5NpTGK0=;
        b=AjBUSO/6lbGkVwHqk32BrIUIm62Oajf6BtzNoiV/NQE+rxfXOluOc/nhm1NPz64EPV
         kMfPgLLPdpyZhTUg2PbgwB23CSIzOCKCGilqJuJtDlUq8JOzOis1z+1V82nGTHSPnejO
         tV6B9u0TwhhS2A1UFGxf1zdOjWtA12OjBFkZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690985504; x=1691590304;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kf80teLEbPHcRdOUL6lRjhfpJhOugqIup/sh5NpTGK0=;
        b=BHA4k3jVVv4WFT/4fh3uSNL96kVwDL1ZHUFuxkhKF9PxR6PM+mAbgdd95JvoTMsLPK
         xpNozDEL7Fv8gKKsY/lB0DVcRX+lJGyTINO6sDAHk43QXM/iVl1HTIwwm494BBNhW6Ed
         33XU4XWMD+r3reW97puocshJsvsrGOCqAkz8coH1KIfhqaBKmFQ8cR3XmCs8rUuQ3NUF
         vja5Zd5EMhZFKXrMaGoVrPkoms98G0W93V9jU55ncNA1bBARO3TpqCGsDVMjFBdYsUZl
         MKA9aSZPb+e0YG8FEYSrymg+9W6pnKcTXceB9y/nbKhOj4bhyVbmsVzZ0In5rjSMT8YL
         nBbA==
X-Gm-Message-State: ABy/qLaxTNbMxl6Hlw2apsW/kj6nn4qLD1j3hhTQFu2lFWWkgWzS9pMN
	3wLEAsFX9y7BxIRYpVwPIOw3HQ==
X-Google-Smtp-Source: APBJJlFQItntLdpVrAi8VjKbT3SEQgjDvXQYMGkoxR/ylWNHiCQDpSy3blCyu6ShIKd10ritezqAnQ==
X-Received: by 2002:a0c:fa88:0:b0:63d:8fc:ae8a with SMTP id o8-20020a0cfa88000000b0063d08fcae8amr15349797qvn.2.1690985503928;
        Wed, 02 Aug 2023 07:11:43 -0700 (PDT)
Received: from meerkat.local ([142.113.79.114])
        by smtp.gmail.com with ESMTPSA id p4-20020a0c8c84000000b0063d281e22f1sm5539125qvb.17.2023.08.02.07.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 07:11:43 -0700 (PDT)
Date: Wed, 2 Aug 2023 10:11:34 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Chuck Lever <chucklever@gmail.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: Most of my "b4 am" runs fail the DKIM test
Message-ID: <20230802-failing-cheer-6f381c@meerkat>
References: <CAFMMQGt=-0HRpmb+fD0e_LVeZ_TPr-8QEPnorAkffrVOowb4dQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFMMQGt=-0HRpmb+fD0e_LVeZ_TPr-8QEPnorAkffrVOowb4dQ@mail.gmail.com>

On Wed, Aug 02, 2023 at 09:53:10AM -0400, Chuck Lever wrote:
> I recently started seeing this quite a bit:
> 
>   ✗ [PATCH v4 1/2] SUNRPC: add verbose parameter to __svc_print_addr()
>   ✗ [PATCH v4 2/2] NFSD: add rpc_status entry in nfsd debug filesystem
>   ---
>   ✗ BADSIG: DKIM/kernel.org
> 
> In fact, even my own patches (sent via the kernel.org SMTP relay) fail
> this check.
> 
> What am I doing wrong?

It's really hard to troubleshoot, but you can try the following:

    $ curl -s https://lore.kernel.org/linux-nfs/5b0eff4e3ef9bf9621f5095189933f60def40f0d.1690569488.git.lorenzo@kernel.org/raw | dkimverify
    signature ok

If you don't get "signature ok", then my guess would be that there's some
problem performing DNS lookups for public keys.

-K
