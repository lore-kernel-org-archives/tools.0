Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943472F2D
	for <tools@linux.kernel.org>; Tue, 27 Dec 2022 15:29:47 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id i188so12934463vsi.8
        for <tools@linux.kernel.org>; Tue, 27 Dec 2022 07:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LbO9n139jb9QluhfZmgzn6Lz69CYZdbpGmJOUuamq80=;
        b=C6ysi3GYSuOI9pJgVbULoWhm71XFwiWhNxZsLLBn8F9V8Yb8zwjwIJgWcAcROhDyXz
         9BYhr8D+gjHz2UJ5nMnIHi/RNe8KKFo8D0MNY6eWfqCOkibokjMJl7cIaghW+SyuGOgA
         7SxXshiNYt3uSpqlWp6d58xRIr7I7N7dFzKis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbO9n139jb9QluhfZmgzn6Lz69CYZdbpGmJOUuamq80=;
        b=Z7nJsjeinw74vML9R3dN95y+yx0cX9g8GwlGMwEMkt2fVkX4wEfKvExTEbkJbm7c7D
         CJSOZOd46oR7oBzlpLKpyBuI0I+y6mn2u3We7+nAriNn5yt7HTgZNrjGJLPzlNwzPj7L
         9MbFtR4ehbTr0wcmn944d+In6+Senyxr6pw78v92JUtPGMnttPcx48uL0v21GWfl+r8P
         7lbRW7DtYKUo4eB3++1w1m6a5nzOygVftMfsGdbKBTwnQ7z/3RBn7KXkj6OHYGLF2TIt
         02tc+qv/++VEcdSJg1s5U1wsBu/ILPpbQv5xL4S4Mf1AO0GRWPpd33g0A+lIJzhGJUbg
         tfcA==
X-Gm-Message-State: AFqh2koLplk0g+2ZAAEI5s6Yqp/+4JeOLYaxQvTaoEu2QjtMpc9vg5zV
	EzQoOkl9HtfrMQHMFrda5rZVMmL0fa5P0QcQ
X-Google-Smtp-Source: AMrXdXsQGXTI7OwXinJDOgyhxBighcfQtw39/Cstt9SCfvUtksJ6G1sa1lREcfgrk+Ze7EdhoyWYUg==
X-Received: by 2002:a67:fe52:0:b0:3b1:2b5c:4e7a with SMTP id m18-20020a67fe52000000b003b12b5c4e7amr8285669vsr.32.1672154986447;
        Tue, 27 Dec 2022 07:29:46 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id 19-20020a370413000000b006feea093006sm9412609qke.124.2022.12.27.07.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 07:29:46 -0800 (PST)
Date: Tue, 27 Dec 2022 10:29:44 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 prep -n ignores b4.prep-cover-strategy
Message-ID: <20221227152944.ubsn5itf2u57jlsa@nitro.local>
References: <20221223170114.oairw4taqptkq3ou@blmsp>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221223170114.oairw4taqptkq3ou@blmsp>

On Fri, Dec 23, 2022 at 06:01:14PM +0100, Markus Schneider-Pargmann wrote:
> Hi Konstantin,
> 
> maybe I am doing something wrong. I set the cover-strategy to
> branch-description in ~/.gitconfig:
> 	[b4]
> 	        prep-cover-strategy = branch-description
> 
> Then I create a new branch using b4:
> 	b4 prep -n up/test -f v6.1

Weird, I can't replicate this. Something else must be going on that overrides
the global setting.

> I verified the config variable:
> 	git config b4.prep-cover-strategy
> 		branch-description

The only other place I can think of is in .git/config for the up-test branch:

    [branch "b4/up-test"]
      b4-prep-cover-strategy = commit

However, this should have been deleted when you ran "git branch -D", so I'm
not sure why it would be left over in your .git/config.

If you can rerun "b4 -d prep -n ..." that should give some debug info during
branch creation that should help figure out what's going wrong.

-K
