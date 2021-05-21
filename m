Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C6070
	for <tools@linux.kernel.org>; Fri, 21 May 2021 12:28:39 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id 76so19426102qkn.13
        for <tools@linux.kernel.org>; Fri, 21 May 2021 05:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3mib4vs3NrUW6Z3/OQPB4ffMpRGM+GTRTDJw/QHaUfY=;
        b=Spqw/lbA8GNz6LDyCXmiKYIhL59TvSDG0l4VaTSMTZZdl0xW+MjgRqGm2C0/DmtPZe
         3UNja2Xfk+u/HwAxtRky3gueduRUANvZFtEOIHZCrWYNiFZkKzRogl3XyjcKKPvxhrgW
         bQspGGzUa+4xtQQM7rAFw1AAAUpdl2RswflFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3mib4vs3NrUW6Z3/OQPB4ffMpRGM+GTRTDJw/QHaUfY=;
        b=oJbm99NAZybvUPMltgp+unCL3KzDDdmwv9ujBU0mHwTW4hsQMxj9vPlhDGKWTDJQFj
         ltZs3qoTnXsX9TK/p2XKDTB6ant0cun3vTE1n7SZixv4Uz1OsEba90xCmfJ6scMkPyX4
         o+VzsmBXvXvJ/18Cao+bObQIaRS9nZPjPqMG4l8n5pqYE50L++UrtlY9Yc5szcUS3Xx6
         N6SxPUKuWOe1ucs+18Yn4SQ4xfNPnNcHah1Kq0MMIEbiIkv8BQ79qoJf+YQEcACFHnWm
         0uoXe7LuUDx1LQS3dUN+9HlfVZQJqj8Pc9kklm/CDQEYCS9vM+r17eMfc+8c7z9hgYxd
         EXvw==
X-Gm-Message-State: AOAM532wDYM9o3KCI13xDcfauFw8yLhE+0O1kJ+f2A1PCBgLomDXBSIj
	9LBH4lEcdoXWTsnB0bm9UiJIjQ==
X-Google-Smtp-Source: ABdhPJwJocqKURJr7gqDt/e3wId5lJSNRV0nodj4LQxTgJcZ2JkvCqmHyp+QpTGfqPSVVA4R58kWmg==
X-Received: by 2002:a05:620a:146d:: with SMTP id j13mr11673156qkl.493.1621600118378;
        Fri, 21 May 2021 05:28:38 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id s11sm3356744qtn.77.2021.05.21.05.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 05:28:37 -0700 (PDT)
Date: Fri, 21 May 2021 08:28:36 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "users@linux.kernel.org" <users@linux.kernel.org>,
	tools@linux.kernel.org
Subject: Re: b4 not finding explicitly specified patch
Message-ID: <20210521122836.lifamz3ikutnc65e@nitro.local>
References: <CAMuHMdV7gLtcuW6sCJh3HyWpgwr1rcCEEaDkN2L+chZgVMQTpw@mail.gmail.com>
 <20210520220605.6cnct2wdmjxlz52c@nitro.local>
 <CAMuHMdUstawScbrpwiQSMuH54YFXYzB0Dsm9BuXXvFZU77Nz5w@mail.gmail.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUstawScbrpwiQSMuH54YFXYzB0Dsm9BuXXvFZU77Nz5w@mail.gmail.com>

On Fri, May 21, 2021 at 09:06:20AM +0200, Geert Uytterhoeven wrote:
> > Well, only 5 months later, but I do have a fix for this in the current
> 
> Off-by-one error: 4 months ;-)

Oh, I'm using a special "Pandemic Perceptive Timekeeping" where for each
elapsed 4 weeks you add an extra one. :)

> Note that without "-P_", it still downloads the series not containing the patch
> I specified.

I'm not sure if I can fix that, because that thread is a bit wonky. You will
notice that we have:

[PATCH v1 0/5]
...
[PATCH v1 5/5]
 \- Re: [PATCH v1 5/5]
  \- [TEST PATCH v1]

b4 is really built around retrieving series, and here we can't figure out
where in the series [TEST PATCH v1] belongs. I *believe* the intent here is to
replace [PATCH v1 5/5], but it doesn't have any counters on it, so we end up
ignoring it because we already have a [PATCH v1 1/5].

I'm not sure what the *proper* way to deal with this case is -- at least in
the absence of -P that specifies "I want *that* exact msgid".

-K
