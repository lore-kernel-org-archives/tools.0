Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD73571
	for <tools@linux.kernel.org>; Fri, 14 May 2021 20:55:40 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id t7so601389qtn.3
        for <tools@linux.kernel.org>; Fri, 14 May 2021 13:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qM5pabZlCYUOVbwfEm8tPg1IPZrTf/xfmSQOyCSqsLA=;
        b=QGGppJMLRKdiN+XYkO9ShJk/O40Kz66oNYbxfxIqNeYk/w/6zhBk2j6/x01v+oy2LZ
         MwNxGRAYoGnrarD5ribeCyzns8PezmTnJc12t+KCX+OYnk/XwXjQP8qHFs2W/w47PMX2
         BbPEzyQaE7fNaB2tHoKiE5wkgbF/Bv15TdITE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qM5pabZlCYUOVbwfEm8tPg1IPZrTf/xfmSQOyCSqsLA=;
        b=e7byiqCmyZCpGPzMhDcl1KjHFKHCEC46yjnD+BdRBfI0MIFvGIdd//l9qVGgFXW1s/
         3hBv3zuvA/g1z8eXGDRLgS26jXo1FP8XuUq00iqo/zeFinKCJvGbEXdq5o2UQz63oFjf
         50cRxIu0f+u5DFJG+LnQqMqFnCg/A0i2Q4H/1OYc0okDs7LEGQKH0QeP0Y0let7SMw9q
         btWHolQJelzVCo233ZgkABfJncX/F/47xIU0dH8Qu/LlY6tU84+Zk8VrkBoDeXod37mK
         VAk9d2uGYyVKHE2zdSrqsLl9rKSJ2uTyhkiUqOm3f7KSJ68ETVwqbC7fBcfXQf6kc4md
         QaBg==
X-Gm-Message-State: AOAM530pPWcbezpPWLDGaioliJbbQTDwNJImp2uH7xb43SbCdFe6F/VV
	hUbbFKW1Roq41SsOxICOPspKIrQWwm+2EiF1
X-Google-Smtp-Source: ABdhPJxMTiJKDajCPcs9ZXs08cr46RZgEzJdjserYEf0SZtY42bUooUGHazoVDDbe32CKiNpT+ienQ==
X-Received: by 2002:ac8:51d6:: with SMTP id d22mr5628857qtn.67.1621025739760;
        Fri, 14 May 2021 13:55:39 -0700 (PDT)
Received: from meerkat.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id c14sm5390353qtc.5.2021.05.14.13.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 13:55:39 -0700 (PDT)
Date: Fri, 14 May 2021 16:55:37 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kyle Meyer <kyle@kyleam.com>
Cc: Morten Linderud <foxboron@archlinux.org>, tools@linux.kernel.org
Subject: Re: b4: Ensure we read threadfile for message-id
Message-ID: <20210514205537.s7eofbqkbjziofbk@meerkat.local>
References: <20210421202942.1358011-1-foxboron@archlinux.org>
 <87im4fi55o.fsf@kyleam.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87im4fi55o.fsf@kyleam.com>

On Wed, Apr 21, 2021 at 07:33:55PM -0400, Kyle Meyer wrote:
> I haven't tried, but it looks like you could update the get_msgid() call
> in mbox_to_am() to use mboxfile.
> 
> Another approach would be to avoid collecting the msgid more than once
> (something like below).

This is indeed a better approach, so I used it in the latest dev commit.
Thanks to both of you.

-K
