Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC4B29A2
	for <tools@linux.kernel.org>; Tue, 27 Dec 2022 15:14:36 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id g4so14671533ybg.7
        for <tools@linux.kernel.org>; Tue, 27 Dec 2022 07:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i7YhxVGN1IcsPYhhb2PtwiukTXlKqQ9Dr2fc4FmZTKE=;
        b=d8YMEVMn1W3jczul+kIqKQ+i5rkbJNe9uPUwtD9XMvk1EREx1T7Zaav032OcLqr8uA
         7uEXgVd3Xvxz2lSM//QNJswVWY+oFrqfO6XlPHeA1QIugsCN2Xh/kbWd+ly8/dnL7eaM
         iB/FoqH1dZwMgXFhdvdBIx87IzSzbmrViJtJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7YhxVGN1IcsPYhhb2PtwiukTXlKqQ9Dr2fc4FmZTKE=;
        b=p9h1AHBGO9qgc6n8RGhLbZa/zcjgQg1NJl/lUQPtkHhBZv8wFf/g9kKa9NIbwSkN3t
         7RNj04fxa35gd4mggsuN34Al1ymoPYRqHdmAFuu+Po7ChNLWyDJpPaSMFm4d5gDvPrVU
         T3Eb/bqEd5bFuR3XfXT09vV2xIR7y4PQVsCuzO770nNzL8kOWVE6ICCGQrHJiZWaxebJ
         R49MWgfqqgrDMmSVE6LuyanLl0qjqYrcsb5OKe+4pAvZm0hG/27KDWae0QnILFNkZMLb
         Wcb44j4ae8tUOw1kHxjhYwkTioepQZ9m19b51j+sys2KX8sO/VsmG4vd2XBrlIMWbyDV
         eigQ==
X-Gm-Message-State: AFqh2kqS+nur6Xw/rf2Im7pFErhOHZ786ChSYTEX7fkONfI99zZfYDP9
	MuI4qSBXwYME97f+/Wpq9XDsG98fQyE+MmOr
X-Google-Smtp-Source: AMrXdXtB+/eLeqxtDvYkswsDGbtNCkD2usOlfHB8EeRQ/Ctrv4lpuSCw7/W+bkpqG2xKFW5GhGeOWQ==
X-Received: by 2002:a25:f41:0:b0:749:612c:efef with SMTP id 62-20020a250f41000000b00749612cefefmr20811857ybp.18.1672154075777;
        Tue, 27 Dec 2022 07:14:35 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id ay20-20020a05620a179400b006fb0e638f12sm9638505qkb.4.2022.12.27.07.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 07:14:35 -0800 (PST)
Date: Tue, 27 Dec 2022 10:14:33 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: tools@linux.kernel.org
Subject: Re: b4 prep from detached HEAD
Message-ID: <20221227151433.tg4yldmlyyubqpgu@nitro.local>
References: <20221223101539.xlacupmglv2dw4oz@blmsp>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221223101539.xlacupmglv2dw4oz@blmsp>

On Fri, Dec 23, 2022 at 11:15:39AM +0100, Markus Schneider-Pargmann wrote:
> Unfortunately it seems that b4 prep is not able to handle not being on a
> branch:
> 
> 	git checkout v6.1
> 	b4 prep -n up/test -f v6.1
> 		Not able to get current branch (git symbolic-ref HEAD)
> 		Not able to get current branch (git symbolic-ref HEAD)
> 		Not able to get current branch (git symbolic-ref HEAD)
> 		Not able to get current branch (git symbolic-ref HEAD)
> 		CRITICAL: fork-point v6.1 is not on the current branch.
> 		          Switch to the branch you want to use as base and try again.

Yes, we currently use "what branch you're currently on" as our base tracking
branch. Knowing the base branch is less important with the default commit
strategy, but it will come in handy when I add the "prep --cleanup" feature
that will remove prep-tracked branches if we find that they have been merged
into the base branch (e.g. master).

I will probably add a --base-branch flag to go with "prep -n", though, so
eventually it will be possible to create new prep-tracked branches from
arbitrary locations in the tree.

In your particular case, you don't need to checkout v6.1 before running prep.
You can just start in master and rerun "b4 prep -n [name] -f v6.1".

> Also b4 translates my branch name I wanted to use 'up/test' to 'up-test'
> is there a reason for that?

Yes, the branch name becomes the base of the message-id, which in turn becomes
the base of lore lookup URL. We replace all non-url-friendly characters to
avoid a url-encoding mess.

Best wishes,
-K
