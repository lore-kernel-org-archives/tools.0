Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B162CA7
	for <tools@linux.kernel.org>; Thu, 16 Dec 2021 22:11:10 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id q16so282867pgq.10
        for <tools@linux.kernel.org>; Thu, 16 Dec 2021 14:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Qckl9VCiLhuB0OfvO/ALBYnfZa5TTHrEA7j83j3PPTw=;
        b=cD3Awn/tvFFutuhH2M1YfaF8iFEbygJgVs84Y8qqqFOmQVapUAI/AnGw2JI5CLdEsA
         82G9jc8OD6dEx2ufTWPYqLu5Rwo5Mqc+cJU1ANwXkXYG+rbMZ3YgLD4HRokkR7ifvumr
         MHpHvBcuPSS1c2ID3iEs3Or13REzHgpGwzr/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qckl9VCiLhuB0OfvO/ALBYnfZa5TTHrEA7j83j3PPTw=;
        b=oZnyYQC0+wA2Y4ogLy6zf1mzCIPcLh7nhuOhDHfDuC/ZifGh/u86EctxoA7IWrfTjC
         Sr9sixuHTAgsoHMK6MDenOdTC+tHiUhBISK2t7WavY7JYK8VaEW0ex43JY5tBSQHIBt3
         qwAWOp5NnSBI8eCZS/HVZgjd82Bno7iOYRXLx0qgbQzMaQSEMYuqjbBWLzqSf5Qx1cwU
         WauPKgI3/SzjHI1BMxgWXx47SirlsmL4NJw05VllKGdew018KWNjk339VGNIJ2n+p1Fa
         wW8exJBUgVXHUrO+4GqWI+0JHgg3WvCZGpxbM3CaEKGCWCmz3imRd4Qy9J/e94fJHj7w
         zoBQ==
X-Gm-Message-State: AOAM533XFH/6bDF0WlgoULmUfZXi6D6aFRQb9v4qs+UydbSPqL9/a19u
	3Q9gTgLazIiFU9Mip0Dys3WmsSRmByxJug==
X-Google-Smtp-Source: ABdhPJzkFs2vrHI53QIHzCz/DBk0Ar1un9S9R1pO649e5kuGkycf+uAhlixUUL8LGCnXNYSXVrIlKQ==
X-Received: by 2002:a63:5357:: with SMTP id t23mr215672pgl.40.1639692669689;
        Thu, 16 Dec 2021 14:11:09 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n3sm6320268pgc.76.2021.12.16.14.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 14:11:09 -0800 (PST)
Date: Thu, 16 Dec 2021 14:11:08 -0800
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH 1/2] patchwork-bot: Ignore empty context lines
Message-ID: <202112161410.FCEC1C1189@keescook>
References: <20211202233836.2024510-1-keescook@chromium.org>
 <20211202233836.2024510-2-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202233836.2024510-2-keescook@chromium.org>

On Thu, Dec 02, 2021 at 03:38:35PM -0800, Kees Cook wrote:
> It seems that there is some mismatch in diff output (or storage?) between
> git and patchwork under conditions I haven't figured out (MUA or MTA
> whitespace stripping?): patchwork appears to ignore empty context lines
> (i.e. a line that is only a single space). As a result, the patchwork
> hash will not match, and commits will not be identified in patchwork.
> 
> As an example of a commit in upstream that patchwork-bot cannot locate
> in patchwork due to a different hash, due to the differing empty context
> lines:
> 
> $ MSGID=20210911102818.3804-1-len.baker@gmx.com
> $ wget -qO- https://patchwork.kernel.org/project/linux-hardening/patch/$MSGID/raw/ | \
> 	grep '^ $' | wc -l
> 0
> 
> $ SHA=f11ee2ad25b22c2ee587045dd6999434375532f7
> $ git diff ${SHA}~..${SHA} | \
> 	grep '^ $' | wc -l
> 2
> 
> Teaching patchwork-bot to ignore empty context lines allows pwhashes to
> match in these cases, which lets those patches get located again.

With regard to the revert, do you not see the above problem with your
repos? I'm working against the same patchwork. I guess there is some
other root cause?

-- 
Kees Cook
