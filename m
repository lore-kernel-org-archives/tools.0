Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40853FC5
	for <tools@linux.kernel.org>; Mon, 20 Sep 2021 20:29:33 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id 93so12079042qva.7
        for <tools@linux.kernel.org>; Mon, 20 Sep 2021 13:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ghe4pFKzt4EBY81QLgY2mQl1+QDFfwLkO1j9b9ZUe0g=;
        b=IEDDHtb+6QaB33kWyvnXzRPfwAiTZzGXVAIX+FOAfJJu2LH+uzH5Y2P++CZHASPSrS
         BUIMYXprHPJrQcxJsBvRyhuSodmw2gcjXPPm991G+ElJddqItsPVC24QU7LrT71U7mGb
         c6uIvYz5xOp+VgJMA4v116jVppdhyV2UOlWw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ghe4pFKzt4EBY81QLgY2mQl1+QDFfwLkO1j9b9ZUe0g=;
        b=3gdI2uM1wfcZ4QBd2CXE4GdMzMv3CZApvoke5n1J/HPymu8FFO9G1bTkfEXcNtl7AA
         LCmdXpnDuemNenbBrMkVLU99j4VeoNiBbNoeZYAZERXtuaX0xbBzEXJXC0Rp12o2hmKh
         lwxUs/MARd6oENDpmLI64kO3f7vhIKmejZlLmP2zWx1Y0EXwZI4YHIo+imHxAbyBBgo3
         WaZHfoUCFtAx3wLiKO52HMRxluzxVjwC0FpTOfqRVq8VTw1cVhsjdl62MGslNqTKpeZe
         h6svUcXmrGLQ1HgdJYrtBwIodXJSSa4zEWbJ6g39+JrbAJHqYuIZbq/cLvZbAxCZ94am
         RYsA==
X-Gm-Message-State: AOAM530NI/YWgZOOLhn9/SPoavlZY26nBFMe5/FEGeydF9+ldSxQWBpT
	pBix9EvnJuyvpvQyoFVr+XUgKBsd6NFypQ==
X-Google-Smtp-Source: ABdhPJwM/g3ftgFk8nWGHNON1vlSRM8JfsQUzcHyrCIo7IYpV9v7uxc5AjpHLA0//sxL4hLk1HSaIQ==
X-Received: by 2002:ad4:4b0b:: with SMTP id r11mr27363039qvw.49.1632169772821;
        Mon, 20 Sep 2021 13:29:32 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id d5sm2115983qtr.61.2021.09.20.13.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 13:29:32 -0700 (PDT)
Date: Mon, 20 Sep 2021 16:29:30 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: tools@linux.kernel.org
Subject: Re: B4 thanks helper
Message-ID: <20210920202930.lw3cgzuuztexrml3@meerkat.local>
References: <YUihigXZKZauguF0@lunn.ch>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YUihigXZKZauguF0@lunn.ch>

On Mon, Sep 20, 2021 at 04:58:18PM +0200, Andrew Lunn wrote:
> Hi Konstantin
> 
> In your LPC talk you said you were working on having B4 generate Thank
> You's for when a patchset is merged.
> 
> patchwork already has something like this. Here is one from the netdev
> list. The problem with this is that it is anonymous. You have no idea
> who did the merge. With netdev, there are two maintainers, and other
> subsystems have multiple maintainers.

It's not really patchwork -- this is done by the git-patchwork-bot, a separate
(and older) tool that I wrote a while back:
https://korg.docs.kernel.org/patchwork/pwbot.html

> Maybe this is not an issue for b4, if it is used within the MTA, not a
> bot. But it would be nice if the generated text contained the
> maintainers name doing the merge.

I'll see if I can make the reports include the Author of the merge commit.
Thanks for the suggestion.

-K
