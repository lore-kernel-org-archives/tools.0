Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEA172
	for <tools@linux.kernel.org>; Tue,  7 Sep 2021 14:31:10 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id b4so8118112qtx.0
        for <tools@linux.kernel.org>; Tue, 07 Sep 2021 07:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bHXA1R8Zlzzf+alrkU3k7dWsqpSRvL44MCdGfaNJKGI=;
        b=Jd+FTVC0ddTyRBFprDTLKSLYXbbbNMRRNggmHeWef7KWksPrqeQ1RwtZuXaF/pod/D
         fiEDDbbzGlWPfYQ8+ObpB4LwHwB4xewo1Sn0E2EmE6VPY9JmuvbyU3vPKN0eQNVqukcg
         muDw6lc/PAkQ/hPxvg63E5fLJ4280kZGMK5uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bHXA1R8Zlzzf+alrkU3k7dWsqpSRvL44MCdGfaNJKGI=;
        b=U+81xvk9iusiKKL7xDHUg+8wnT79a0Lc2opAd+TFKBKANctVZBVxGIjKPUeGvJPM4L
         mok8joXuQ/hLruvwoXviLFq444VvOti9/87QXFQY56ndvweCJVubSi2IiHeWJRaExeYN
         f3r45V+T7PkiBj4qyPxNqicALCw6NhkcOzcFsQFfgYPARx53M9bVvCPWCiheOrgy5xwV
         P2OXam97OCwswHuVYxzGZu/PZzoQ+91+P2uYLHg9uPHiPMj6YXayAwJFUsg/NkELLTCC
         UF1XGpBCpabmo0XRI9wWIlepUgXjMRXhFJ5HVle5ASHXxYv5YJGOZsI+xiXDAA94dj7J
         oeIg==
X-Gm-Message-State: AOAM530j2zx3z1OHECPNxJsHj2OdmdY4rD0/evk5OkIvvIhPutI543xG
	WTW6JGeMJdikAVt/YppmahJrwQ==
X-Google-Smtp-Source: ABdhPJz5XwN38sXskjbYlX5So8ms+cnZMcvfIyd6kcZ17wwgQPXiJYrKVR+jN+8DnhjJKitV2Sbniw==
X-Received: by 2002:ac8:53d6:: with SMTP id c22mr15283295qtq.38.1631025069191;
        Tue, 07 Sep 2021 07:31:09 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id a22sm7579814qtd.56.2021.09.07.07.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 07:31:08 -0700 (PDT)
Date: Tue, 7 Sep 2021 10:31:07 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Saurav Girepunje <saurav.girepunje@gmail.com>, tools@linux.kernel.org
Subject: Re: b4 and lore and '/' in a message id
Message-ID: <20210907143107.dlygwnyl3v5w345m@meerkat.local>
References: <YTcJNrbjTVMXCQUG@kroah.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YTcJNrbjTVMXCQUG@kroah.com>

On Tue, Sep 07, 2021 at 08:39:50AM +0200, Greg KH wrote:
> I've run into problems with a specific user that happens to send patches
> out with a '/' in the message id field.

There's some interesting interaction between nginx, varnish, and public-inbox
that results in this behaviour. There is a way to solve it, but I don't like
the approach, so I'm going to work with upstream to see what my options are.

-K

