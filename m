Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.180.1608329360749243426
 for <tools@linux.kernel.org>;
 Fri, 18 Dec 2020 14:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VwkwDLEV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.181, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f181.google.com with SMTP id a6so2466112qtw.6
        for <tools@linux.kernel.org>; Fri, 18 Dec 2020 14:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uQts1b98/mRZTfJfvk05bN5xL3qf5xK7cdGq+GXgR+Q=;
        b=VwkwDLEVaM4UTwBdOSYTeE2UrPJLWQAS9dqx4+6RdWVKne1VJ/N0mlN0cja3HTseh6
         /U1tn6Slihz7w8UePRyKF9zpC6HUE5KUFMY6FID2qAXZrTUgTHjB7B3yo63iDxQ3Jclv
         xP7qyR/rOkeHRd4RfS+WJcP/Fzj5l4vh6KkTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uQts1b98/mRZTfJfvk05bN5xL3qf5xK7cdGq+GXgR+Q=;
        b=KhXBd2gWQadTMcsoqiJtdAtVREcSwBZuUlLiiD6plVTyscsf50Y5WSyKa+41vliI1o
         TiwPXKnfTT1RkZp7v7phfHc0MuQhLU3Yp7/Skx1GOyM6MPqxcNeI9e1EnInusU5SZEOf
         EfoVzXRo60HgtChmgrLFlQ+Ie8m021svgCUQI7GBlppk/1gNQrXLluZqShCJUsxJZpmJ
         SM//SYNk2GNFVDGoxc3YEPId1cJdA5D3j5z94ZifnbwzZk9U/hqJDfQOFRsfstrQvWik
         i7I+mwAw89KbNtOblGOSxZxHYFFRQ7H9yUYlGkaBS/da8ZtSCpOVN1RmFAUmRJ8ba+32
         2q3Q==
X-Gm-Message-State: AOAM530ASAD/CxJdD7xSiYEeX0nTe7sYkqg8AETUK9uCdhNHv5IsPrCb
	U5pea+1uFe64UsYMg+6r8wVoTQ==
X-Google-Smtp-Source: ABdhPJxCbpaLbqH2yl/NGyigOFDakaWCfQXD9uKu56aT0FaKibutbMVt0UVL47Bc0SDwXZXEj7dIvQ==
X-Received: by 2002:ac8:7754:: with SMTP id g20mr5905124qtu.27.1608329359752;
        Fri, 18 Dec 2020 14:09:19 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id 198sm6237170qkk.4.2020.12.18.14.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 14:09:19 -0800 (PST)
Date: Fri, 18 Dec 2020 17:09:16 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: users@linux.kernel.org, tools@linux.kernel.org,
	Jens Axboe <axboe@kernel.dk>,
	Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: b4: encouraging using the cover letter in merge commits?
Message-ID: <20201218220916.p2yzwotpantfqtss@chatter.i7.local>
References: <877dpeol5w.fsf@toke.dk>
MIME-Version: 1.0
In-Reply-To: <877dpeol5w.fsf@toke.dk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Dec 18, 2020 at 10:32:11PM +0100, Toke Høiland-Jørgensen wrote:
> I notice b4 will already save the cover letter along with the patch mbox
> file, but maybe it would be possible to automate the workflow some more?
> A 'b4 merge' command that wraps 'git merge' and pre-populates the commit
> message with the text from the cover letter? Or some other trick? WDYT?

I've been careful to operate on the "principle of least surprise," which is
why I try not to make any changes to the git repository directly. B4 will use
git commands, but in a way that don't modify the tree (only prepopulate
objects behind the scenes, etc). For this reason, I'm wary of wrapping any
git commands directly with b4.

One way I can think of is to save the payload of the cover letter into the
.cover file, if we recognize that we're in a git repository. Then, when
performing the merge, you would run:

git merge -F .cover --edit --log branchname

This will preload the cover letter into the merge message and let you edit it
before performing the merge.

What do you think?

-K
