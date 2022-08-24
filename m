Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B9C7B
	for <tools@linux.kernel.org>; Wed, 24 Aug 2022 14:01:54 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id h21so12767876qta.3
        for <tools@linux.kernel.org>; Wed, 24 Aug 2022 07:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc;
        bh=RravMFVZXf27yRcxEQu9KHEUqY1eQUnFexkuzceHRkA=;
        b=frjFmj4qQGmdfPE9CrMNvizqyKvWhPqNZgumcOKIp52ZeKyYCimSSuT6jzkfM3efD/
         EUp53rY3jM0kI1lFiL4s1IHm6GfGFMigJoIStVNhm1IPQrr+QDn8vn+zY21Fmnrpjo/2
         SbXQ/zLMwVZGc4HFU5quSsD174/kMGKTvYOQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc;
        bh=RravMFVZXf27yRcxEQu9KHEUqY1eQUnFexkuzceHRkA=;
        b=u9OfT+b4KEncQmTfLA2prUclJrsOmta/9KpmlvVFsD3VfOfLiW3nNNPGMaTxtP/63E
         +ItxclUg/kx6L7pCmYIY6Dau1Mf9guhpVGm9ISpwEUZr4nW7el36RWKRsp59Pee7myJT
         WL5p3OkTupqdMAMv6JggJ2s2oIGLopSgd3EU8zOWfAk+rydAORxL39nnp5EoanC8QPGa
         chpmI8/zyKrNljSmwGBOcjlICmaB1LnRgqmh72/Zp6VYw4e/xI/sVOtZ6qJKFkfWMCJ6
         eDlLrET13Tgi2mFinlp1xpfNdAOggwgnKVgdiAAfGkHLgQNnDVmZ+CnZSBZW5vhTo3ds
         hYFw==
X-Gm-Message-State: ACgBeo3gVjQ3uV+nsXSRgF0u4J6Jyv832YBGyCzZ2yjphuBMYE48caM/
	cVY33S6AunqPTqftNDBC5V9/wED6hwC7RQ==
X-Google-Smtp-Source: AA6agR4U3Ak3tTKii65mu0gpI65X/I5EcaeiCpO5XRp9fPtzwaJXoMSZHstRjSbpSNUrt+2R7dbnbQ==
X-Received: by 2002:ac8:5f86:0:b0:344:65d7:ea44 with SMTP id j6-20020ac85f86000000b0034465d7ea44mr24296345qta.42.1661349712855;
        Wed, 24 Aug 2022 07:01:52 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id s11-20020a05620a29cb00b006bbd0ae9c05sm13747131qkp.130.2022.08.24.07.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 07:01:52 -0700 (PDT)
Date: Wed, 24 Aug 2022 10:01:51 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, Philippe Blain <levraiphilippeblain@gmail.com>
Subject: Re: [PATCH b4] setup.py: bump python_requires to 3.8
Message-ID: <166134967564.440655.17645159218754031307.b4-ty@linuxfoundation.org>
References: <20220824030526.49825-1-levraiphilippeblain@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220824030526.49825-1-levraiphilippeblain@gmail.com>

On Tue, 23 Aug 2022 23:05:26 -0400, Philippe Blain wrote:
> Since c95e4d1 (am: Fix broken guessbranch handling, 2022-03-31), b4 uses
> the 'extend' action for the '--guess-branch' argument. This action is
> new in Python 3.8 [1], but setup.py still lists Python 3.6 as the
> minimum version.
> 
> This leads Pip to allow installing or upgrading b4 on Python 3.6 or 3.7,
> but then any invocation of b4 fails with an error from the argparse
> module ending with:
> 
> [...]

Applied, thanks!

[1/1] setup.py: bump python_requires to 3.8
      commit: 65ba7a9d3ee989035a875e7c108f1733e92c7ea0

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
