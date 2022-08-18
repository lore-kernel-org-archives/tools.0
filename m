Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFD24A07
	for <tools@linux.kernel.org>; Thu, 18 Aug 2022 21:22:43 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id u14so3092737wrq.9
        for <tools@linux.kernel.org>; Thu, 18 Aug 2022 14:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Vz+lfVJjuZL/wKRCqi/Lbfc4QZY0hUUqYTvSovxoHh4=;
        b=Fid3rBFHL2eUCYLrsRkuowIReRNOmMWQj46daI2uzyIGIeV/7SuRUI11t4uiRkqPw9
         1q3JqwcnI7fvQx/3bznz2NdzHUpJ/tZau48OzGS6jBZdkRkgTp+XcUEcOGu7ewuPy6BP
         ADQOLeCuVTVHvvGKM9D8MXONOZ6NB5L901pbY1+mIQ6DnSVwRyS3euavcyKIlGXQ+lMe
         EyMBWXYuYmLNd5pQrqDRpBMvO6ruSPT2PXp25uGjsxm+qOAz2s7X4SxpzNHQ2/EUxF3r
         RpeMTbp1ru/7zcJWTPvVu6tfDIne4lTkCF8xadGOcYXtI0TiSKxOL8VAmvO0CaekzwAd
         V/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Vz+lfVJjuZL/wKRCqi/Lbfc4QZY0hUUqYTvSovxoHh4=;
        b=BL+0AujpHsbsImb4pEGLjqboxHBS5DPH7FJd44WlKPI9hwDQEl2LFVq07Oj5kYAOTF
         OLxEGKmhX5aYPUJMTNW8UrYR52Lz3dpZnAtEq6L+RbQXAK1/UJbLrqgn5/su8L472+Cn
         4/CMupf/jSZ4cKr8OXH7ZGUAntMJ5Btd1yJZB7ojVzZ3O2kgJOXenQxUtXR5+DDupwht
         5GURJB/Y8lNR62ZPG2tk/LOXhWIyC65f06jKC5IXR2/S/UQ/UyMpi4v8OniWaACnUaSg
         HoUZbRwbtnfA17yG+ETqk9dos5/0CUQZIEcsdik/w28rd+rdBHuE7NcvkjTACIrAsp0V
         ukGQ==
X-Gm-Message-State: ACgBeo1mog5jhhDFfYh08/1Dx0vbi0g/1F7tWZaBJfAJUpIYAhOZt0SD
	xyVOffymP2oAEBECECocS37UebxVJjpp3NP5
X-Google-Smtp-Source: AA6agR7En8QH+N0/FFjLT+HvqAZc6WxblguUnv0mjmdud7DU1YQXAHHZr50L0w0VzaAtFVXCZJHoeg==
X-Received: by 2002:adf:d1c6:0:b0:220:676b:74bf with SMTP id b6-20020adfd1c6000000b00220676b74bfmr2461139wrd.262.1660857761962;
        Thu, 18 Aug 2022 14:22:41 -0700 (PDT)
Received: from [192.168.2.222] ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id a17-20020adffb91000000b002207a0b93b4sm2325052wrr.49.2022.08.18.14.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 14:22:41 -0700 (PDT)
Message-ID: <91fe0c5d-58d0-59e2-febc-a0b78177ab67@conchuod.ie>
Date: Thu, 18 Aug 2022 22:22:40 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: b4 submit ready for beta testing
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local> <87pmhs1d8h.fsf@baylibre.com>
 <20220726142743.dllhmbivtb2yk4uk@meerkat.local> <87bktbapri.fsf@baylibre.com>
 <20220726205653.yjmafga3utcwjef7@meerkat.local>
 <e2ca58f1-3c10-0dc6-ebdb-3ca088b430d7@conchuod.ie>
 <e2198b0d-9688-099d-75cb-99a5bf12191a@conchuod.ie>
 <20220818210442.spgrtaktztqrxded@meerkat.local>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220818210442.spgrtaktztqrxded@meerkat.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/08/2022 22:04, Konstantin Ryabitsev wrote:
> On Thu, Aug 18, 2022 at 09:12:54PM +0100, Conor Dooley wrote:
>>> Apologies if I am missing something that (should) be obvious here.
>>> I am trying to use "b4 trailers" to update a local branch that was
>>> not created using b4. I ran:
> 
> Thank you for testing it out -- I've only lightly tested this code in the
> context of not using a fully-managed branch, so you're probably hitting some
> very nice bugs.

It was fine, a rebase fixed it up again nicely.

> 
>>> b4 trailers -u --trailers-from 20220817201212.990712-1-mail@conchuod.ie
>>>
>>> It took 5 minutes before I got any output from b4, so I actually
>>> began writing this email in the meantime as a bug report...
>>> It eventually worked, outputting:
>>> Calculating patch-ids from 16806 commits
> 
> Ew, this is going horribly wrong already! It's only supposed to find recent
> commits where you're the committer (git log --committer=your@email),  so I'm
> wondering how it's matching 16806 commits in the first place, unless you've
> done some really crazy rebases.

Possibly I rebased the original branch on -rc1, but I wouldn't count
that as crazy. Committer should be Linus. I supplied --base=v6.0-rc1 to
format-patch.

Hmm I wonder if it might be because I am sending mail from mail@conchuod.ie
but my committer/author email is conor.dooley@microchip.com?

> 
> I'll take a look at it first thing tomorrow.


Whenever you get a chance :)
Thanks,
Conor.
