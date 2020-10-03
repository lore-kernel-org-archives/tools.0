Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.8302.1601736052007956819
 for <tools@linux.kernel.org>;
 Sat, 03 Oct 2020 07:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=REtJvHAi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.178, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f178.google.com with SMTP id c62so6655872qke.1
        for <tools@linux.kernel.org>; Sat, 03 Oct 2020 07:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8xtene2kbm/s4TbHh0maJaDKQ3zab0O9iqQEkFHvqng=;
        b=REtJvHAiReCFGJsEhQXMP/2+dBrC7v9BsiF+rOPqX8XeO9rvcPNSWUeEYw1ZqkIkvz
         CXvgrlYvGCtFrGt1e7A3AvzQieW6CQX5RA4w+vv6RpjiZEylyShXQkA5oQHPu0fVvneK
         LSNhYYEiRahEoXXVUNoDdVHb/IBrVfq414JrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8xtene2kbm/s4TbHh0maJaDKQ3zab0O9iqQEkFHvqng=;
        b=mrnPIpNwMZbI6ujb0wqE5ss4VCbn7/pR6O2f5SzPUOckxqp8VQ0i0ozas2R3JN3nUI
         OYVKiazY6VowsY2Agq4EmlLXjFLh4e3f6bC330RgffFsCy0SzPhA4QcFzX9+mWiSy6mF
         MetO2iQbQqccRbhOX0UbR9j/swBkwcErDLMY93VUp4s5mDOKgdBghZ4kiwzg4Cymwu8K
         BKKbUJx+HdLhY8PRLXGpOigasaP0g+WoveDG1wOBR0TkC7fg3drpdhv046JFjS7uut0U
         wQZIMVWi3VuPiKwLHSdl0pke73LzhHU0QkhCcrpdvT3qccvrLqcmCAE7He/93b0nfwb1
         T+lQ==
X-Gm-Message-State: AOAM533a9hTNSpZWcBe63/unfv9xmjyzf4O3y2VJsVf9svG+F3ux9u5E
	DLgzQGjkDEprkXbB5MccyUCZrg==
X-Google-Smtp-Source: ABdhPJwuN8Wqoj8kzONSnhGep+ywdyTPzIH3F3u17CIXTkwfRWjxXwSVSxs05iQtcIfERNk9DmmFwA==
X-Received: by 2002:ae9:e70f:: with SMTP id m15mr7054212qka.452.1601736051055;
        Sat, 03 Oct 2020 07:40:51 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id b13sm3425456qkl.46.2020.10.03.07.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2020 07:40:50 -0700 (PDT)
Date: Sat, 3 Oct 2020 10:40:48 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Mark Brown <broonie@kernel.org>, tools@linux.kernel.org
Subject: Re: [tools] b4: UTF-8 in replies
Message-ID: <20201003144048.eh5rvgdhpd6335qy@chatter.i7.local>
References: <20201001171405.GA17873@qmqm.qmqm.pl>
 <20201001180541.poupp36rtajzkihs@chatter.i7.local>
 <20201001183647.GA23339@qmqm.qmqm.pl>
 <20201001184109.GB23339@qmqm.qmqm.pl>
 <20201001192600.fo2rivqc4nklw4oj@chatter.i7.local>
 <20201002210950.GH5527@sirena.org.uk>
 <20201003101345.GA4163@qmqm.qmqm.pl>
 <20201003101804.GB4163@qmqm.qmqm.pl>
MIME-Version: 1.0
In-Reply-To: <20201003101804.GB4163@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Oct 03, 2020 at 12:18:04PM +0200, Michał Mirosław wrote:
> > RFC 2047 section 6.2. suggests that this encoding is invalid, 
> > because it
> > encodes structural characters (commas in this case) -- the MTA/MUA
> > might treat the whole 'Cc:' as one entry. Also, section 5 point 3 of the
> > RFC forbids encoding the addr-spec part (mail address if I understand
> > correctly).
> 
> IOW, correct encoding might be at most:
> 
> Cc: linux-kernel@vger.kernel.org, Kai Vehmanen
> 	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
> 	<pierre-louis.bossart@linux.intel.com>, Takashi Iwai
> 	<tiwai@suse.com>, Guennadi Liakhovetski
> 	<guennadi.liakhovetski@linux.intel.com>, Liam Girdwood
> 	<lgirdwood@gmail.com>,
> 	=?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
> 	<amadeuszx.slawinski@linux.intel.com>

Please feel free to report it to Python upstream, as we're just 
deferring to whatever decisions they make. Anyway, we're back to 8bit 
headers with the latest change.

-K
