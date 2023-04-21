Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C7A28E3
	for <tools@linux.kernel.org>; Fri, 21 Apr 2023 18:52:37 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-74d981be825so121648585a.0
        for <tools@linux.kernel.org>; Fri, 21 Apr 2023 11:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1682103156; x=1684695156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5YHn7FBm2ODKYO6vF7mM+rm1L15JCc9M88VH9jw+LSE=;
        b=OpLCt9T/9zAETJefvt7DADHK08h65GsS156k+SmfwTWypUJMVrcgl5aFRbm7xr9GAe
         BSiTNpoeZHofpOS+3K+rHSYP0HWuPUgs6jZW/fbMyY9pq4fkDxoWfvag/JxtwIKgNrtC
         DndAuKWg5QXMG0fdYHhp0NvblIgHQGBhultoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682103156; x=1684695156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YHn7FBm2ODKYO6vF7mM+rm1L15JCc9M88VH9jw+LSE=;
        b=fb5K55SOPfH4KBqJ03aZrFFcNm7pOzTwUWDKnfqJGDCPWp5SLnvvwrA1hrCZDF2xbh
         rFIP7xypwEapya/4Fc1shFr2D31Mxdyr1a7x/xTdNWK0EFtxnWRcTEo/72muvM73rUpB
         w1tOZwyJq5zqCPLnKzaLYL5xrNfwc6tM7CwU/44Xs6eLP4DO9qn+xWEYM6gvElrdl8a4
         gFlBSfRPIlKYeu7PSP3ZKgSEDUCEbkW3LQ5m2b/IRmUlet0qjhKRa5i95IYbwrx75JAE
         nZH8DY+epVopVBoZKrwHEP5rXx+017MpoM1fxXDjVg+1WZHuFn8Kx5SLqfy6T0iUaf9a
         xzJw==
X-Gm-Message-State: AAQBX9fx4vRdrb/fOkShMe7INEWdZeM4vH4YbWbNSZz39kkCKWm+ojQy
	arwmRqirbM+UJSEWVH0eN6tpUtj2/GYR1+nSkyk=
X-Google-Smtp-Source: AKy350b//M2kedFnWI4kW7y2DVPTTzCfHB7RI0VL7uk4QOq6Qb1jS1elyN6Wmsl5vU7RkJ3f6STvuQ==
X-Received: by 2002:ad4:5aae:0:b0:5f1:5f73:aed7 with SMTP id u14-20020ad45aae000000b005f15f73aed7mr11242712qvg.27.1682103156102;
        Fri, 21 Apr 2023 11:52:36 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id u14-20020a0cdd0e000000b005ef447e24adsm1373731qvk.19.2023.04.21.11.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 11:52:35 -0700 (PDT)
Date: Fri, 21 Apr 2023 14:52:33 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Tools <tools@linux.kernel.org>
Subject: Re: asdf
Message-ID: <20230421-carpentry-aviator-eb2a5a@meerkat>
References: <20230331-ranged-decrease-6027cce938ff@brauner>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230331-ranged-decrease-6027cce938ff@brauner>

On Fri, Mar 31, 2023 at 12:04:14PM +0200, Christian Brauner wrote:
> Can't be said enough: thanks for b4!

Glad to see so many people start to use it.

> I have two inquiries about b4 send:
> 
> (1) Currently the message id that is generated for each patch sent by b4
>     has the format:
> 
>     [date] - [branch name] - [version] - [patch number] - [random] @ kernel.org
> 
>     where [date] is fixed and is taken from the change-id of the series
>     as you mentioned in a fediverse thread.
> 
>     It would be nice if we could - potentially opt-in via a config opt -
>     set [date] to the date when the patch series was sent.

Sounds reasonable.
bugbot on

> (2) I couldn't find an option to tell b4 send to set In-Reply-To: to one
>     or more messages. That comes in handy when e.g., generating a patch
>     in reply to syzbot report.
> 
> Maybe that's something worth adding.

I worry that this can create really weird thread interactions. E.g. if you
have a bot report and it results in two different series being proposed:

original bot report
 \ 
  -- [PATCH] fixes one issue from the report
  \
 | -- [PATCH v2] fixes one issue from the report
 |
  -- [PATCH] fixes a different issue from the report
  \
   -- [PATCH v2] fixes a different issue from the report

This will confuse absolutely everyone, not just b4. :)
It's best to just use Link:, I think.

-K
