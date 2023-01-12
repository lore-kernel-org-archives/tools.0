Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD35979C9
	for <tools@linux.kernel.org>; Thu, 12 Jan 2023 15:26:23 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id a9so2384963ybb.3
        for <tools@linux.kernel.org>; Thu, 12 Jan 2023 07:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rcrn6md04NiFMXj0ap8vCY2QeTc/Tqpn60IKPQT9Xlk=;
        b=NsXbVtCBDxURU0kAjE+Wk6pT8SLAQiNlGWKOrjERP8qP30jM/FullwRr5dNFJ2TUdl
         W+lTjMiBpdr5SmvbePBIpJkX/lBfHOKp0v52tI+Z7d7gW1c7sjkuOBV7JndX0RsT5rMX
         WwgYhj52/jYxYjNc1X4mXJ63JdU+XNUhCcK3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rcrn6md04NiFMXj0ap8vCY2QeTc/Tqpn60IKPQT9Xlk=;
        b=YuXPd5oZqEF7qJtjIEUagql7BnGCmizSYgzeYj7+jdhxanIMVCZAs6Ua5NiNhx8N8e
         JE8S4Yydv/rt8ctUvnEMiI+bWKuGt4UcW2lShpWKhsH60WuRfE1fE5mw+zWvgj+vQ36y
         9a9Fnwud3adsk7Fw7OD1d71PzaF0eBOG8xX/fYgsiGALPnR+fkFNeF35DIMtUZIM2QMn
         Q7xVrzgZtqm0kitCXKlTXAiaKFYVNY2GwL0hkxXhtD4EMgjpo4exIQ8V4AeH6nX9Brvz
         vDR+vJTDhAK/skYKRe/wqR1avvKmy5eZZJk8Df6zelnuMf3z8X/U7BUjKiWBrd4JQ0wj
         hhxg==
X-Gm-Message-State: AFqh2kpQKuf2cQABHSzeu3YAab1us9ivltey117qxn5SnLoo2hvpOjMn
	r/8feieGPHGFGXWavkJMz5n4tis2h4vzlY6L
X-Google-Smtp-Source: AMrXdXtVUw7nGxo5z+5PPRCTw4sEirNa0pkqrfwC00Vydbw7XNnEi4XTXhU5MmdAQUxyoNW5zLdn2g==
X-Received: by 2002:a25:5e88:0:b0:7ca:d4:19b0 with SMTP id s130-20020a255e88000000b007ca00d419b0mr1375623ybb.51.1673537182818;
        Thu, 12 Jan 2023 07:26:22 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id t2-20020a37ea02000000b006fb9bbb071fsm10955897qkj.29.2023.01.12.07.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 07:26:22 -0800 (PST)
Date: Thu, 12 Jan 2023 10:26:21 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: tools@linux.kernel.org
Subject: Re: Message-ID length limit !
Message-ID: <20230112152621.ersbloeygrvci2ww@meerkat.local>
References: <6b4dc5aa-15a8-438c-ac53-1de49ec95c71@linaro.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6b4dc5aa-15a8-438c-ac53-1de49ec95c71@linaro.org>

On Thu, Jan 12, 2023 at 10:53:56AM +0100, Neil Armstrong wrote:
> 
> Hi,
> 
> It seems I'm hitting a message-id length limit when sending with b4, here's a 2 patches thread:
> 
> 0/2 https://lore.kernel.org/all/20230110-topic-sm8550-upstream-display-defconfig-v2-0-c29b9714c85f@linaro.org/
> 1/2 https://lore.kernel.org/all/20230110-topic-sm8550-upstream-display-defconfig-v2-1-c29b9714c85f@linaro.org/
> 2/2 https://lore.kernel.org/all/20230110-topic-sm8550-upstream-display-defconfig-v2-2-c29b9714c85f@linaro.org/
> 
> Neither lore or thunderbird shows the thread correctly, so it seems the message-id is too long, right ?

Oh, look, you found yet another bug in Python's email module. This brings the
critical bugs count to 4. For no reason at all, it decided to qp-encode the
References and In-Reply-To headers:

	Message-Id: <20230110-topic-sm8550-upstream-display-defconfig-v2-1-c29b9714c85f@linaro.org>
	References: =?utf-8?q?=3C20230110-topic-sm8550-upstream-display-defconfig-v2?=
	 =?utf-8?q?-0-c29b9714c85f=40linaro=2Eorg=3E?=
    In-Reply-To: =?utf-8?q?=3C20230110-topic-sm8550-upstream-display-defconfig-v?=
     =?utf-8?q?2-0-c29b9714c85f=40linaro=2Eorg=3E?=

I've reported this as https://github.com/python/cpython/issues/100991

I can't express how frustrating this is, but at least the work I've done this
week on completely avoiding Python's email generation modules will help.

I will probably end up releasing 0.12 sooner than later, seeing as everyone's
work is impacted by the quality of Python's email routines.

-K
