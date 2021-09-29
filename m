Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B2F3FC3
	for <tools@linux.kernel.org>; Wed, 29 Sep 2021 18:07:28 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id et16so1976025qvb.10
        for <tools@linux.kernel.org>; Wed, 29 Sep 2021 11:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DVusSc5E+lRGg+p8l2M5fQ9D/JNSkP6uqQOATDBi/Bs=;
        b=n1Jz2DI6j7lHzl1pyzoHxaqDj/W8CYDvsK2i+yMQZwcWrpmY4dl+2SCWVfwa6QHuq6
         vhCHX8RiMY0zDjjeqAXT9/fitdHtRFYk94WYiCxDoOZc1RP9Ls2+75fEu9IZ0G5YGzPJ
         s1eIl6u9cAycJTW/XsCxy49TPseEVca+XVX89Kr9ZDpG8o0anj5RKo9TBMMvBcSmNXd2
         zpODoGXMWZQJHOehGI51NwXD2sB6tWLLdNnM4XzkYPjsgByI+pC+TjsZLeE972ng1HFD
         3635E5asAWA1hzzuUuy9WFCu8Ma4sHmUVQoq/rnsV/m46O/dQmX1GEvsm8HE6uRzhRKa
         zT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DVusSc5E+lRGg+p8l2M5fQ9D/JNSkP6uqQOATDBi/Bs=;
        b=T7BXF3OonDTPlzC/aTfYHM4m7zb+PqUtswFCAjfUyBrIpRPQN/UPCvchXfRCh0c0MP
         PSHgbD7sovxpg0mq2sCGnxle5aLcWlnq/FJVZKov8xLM5IigrE4jwcwZxoYsskwSdUSz
         gJMR1QEjdPQQwkjEj5w+DsitaN7NLcjKkNvW9otFt9FIblPUZWpzQtKjd3DzGVfCGMnG
         DhrQjpf5Wea/GvJE/EuhwQ28gdNywCGCz0Zesm+YCa+zfOiGuNCzAVmeud4ax0YZ8x3B
         o6rKHrhyNNmgO4pbWRcEHzfJO6YY+kSLFsXJKqDUuUEZN5/3NxAYJu95+dE9Oap56DMl
         9Z1g==
X-Gm-Message-State: AOAM533j7VC2gJBrqUFjXItue2v3FkP4qUwcy2gSbHQKtV+ke6o7my+y
	jWg/XsTISygoBWLep14UO8ozQPdkKvo4ng==
X-Google-Smtp-Source: ABdhPJx48eLhaW3Ss0lPBgXWbCM8oQVNZBmYRQoGXCtjykPsqV5JJdPLnrS5T7xDMEsk0uZpQaEvZw==
X-Received: by 2002:a0c:b412:: with SMTP id u18mr70663qve.48.1632938847157;
        Wed, 29 Sep 2021 11:07:27 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id f83sm287153qke.79.2021.09.29.11.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 11:07:26 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1mVdzK-007ddG-1Z; Wed, 29 Sep 2021 15:07:26 -0300
Date: Wed, 29 Sep 2021 15:07:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4: introducing b4 shazam (like b4 am -o- | git am)
Message-ID: <20210929180726.GY3544071@ziepe.ca>
References: <20210921202526.mk2meetobbtl3tvi@meerkat.local>
 <CAMuHMdWDh=pkFWvxkikFPh3ACyo8ctO1A-DvA6qq7KZ+Lr7X9w@mail.gmail.com>
 <20210924210826.ebi3ljjdfiuie2pr@nitro.local>
 <CAMuHMdUubqhqyDwkO_x98-M_i1tXsA5KfxhM1RDhrbhby8QT5w@mail.gmail.com>
 <CAL_JsqL-_GhC0L7O5BugC6P_TjhoqL_p3dgBmHuoJfX0fy8gaw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqL-_GhC0L7O5BugC6P_TjhoqL_p3dgBmHuoJfX0fy8gaw@mail.gmail.com>

On Wed, Sep 29, 2021 at 08:39:25AM -0500, Rob Herring wrote:

> Is there a defined right order for Link and committer's Sob? Either we
> have to define what that is for b4 to implement or b4 has to be
> configurable. If the committer != author, then Link followed by Sob
> makes sense. But what about committing your own patches? If you
> strictly follow the patch trail, you'd end up with your Sob twice:
> Sob, Link, Sob. In these cases, I've been putting Link last and a
> single Sob.

I've been deliberately sorting things to be 

Cc: stable
Fixes: xx
Link: xx
<everything else in chronological order>

Ie I think the cc/fixes information is important and should be
highlighted at the top and the link is sort of a breakpoint indicating
that the following is chronological providence information.

I see lots of other things too. Personally I think b4 should push a
reasonable opinion for the colour of this bike shed..

Jason
