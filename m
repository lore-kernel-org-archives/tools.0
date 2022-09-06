Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2504729A5
	for <tools@linux.kernel.org>; Tue,  6 Sep 2022 21:29:42 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id w28so9091643qtc.7
        for <tools@linux.kernel.org>; Tue, 06 Sep 2022 14:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=15J1Jf8orhmdkA3K2Rl2cOvYDMC44SwwxOyoKrnTpYc=;
        b=FGHkpsBnZesq6nSsm0d9WN5uvnHuZzmyEqohf2vcIo8NRKrVuNYvl36JeKjdXgIubo
         9TnH+CiMgGMcTmS7DF5yayn7iFHxNuInSFMnBLpAHDzQNJbiZ+/g6WArM2TBPPgTPkLW
         Lyd75W1YYAbp7l65lNkD+F05mDjvAdrdpxyKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=15J1Jf8orhmdkA3K2Rl2cOvYDMC44SwwxOyoKrnTpYc=;
        b=eOo7BPE+4w7e2McHj4iFeQ7MRmNjbwrP7/jZ9M4Pz6wd8+I2YWGRYYsXWVI7bnHlcG
         LHSHrNx8E7I0HCnvC0kWXpqlxw+0dDpmXH6zn0WRcp02Y9FVYdcvBM7qaKjMLbTPpgU3
         T6T7Lx8Z79wNwBg9kCmuVWRwGGhlRhzdonHM3y3bUTR5+r8pNlbS0tI6MpPQ2/gXqnmQ
         Y6MYsqwnQc/tXWoD63aPQtZm9KvshnYlqpG9zOKWUHyClonaGMDmtRZTnCGODYtODa8n
         rALFcmtpzZPdg+DQB7suKLzByVe80jyYAfDurVQNV9Zai8Wj2MHx5Qo9dkW3HBlnCW1k
         Giug==
X-Gm-Message-State: ACgBeo1A3N7NN0wo7MiXeaHPHQPOHr+/7g/h84Oa1ui9tIAMKcRnSIWo
	dj0Ey5tAtjDzIGKdKNiL0xXVgg==
X-Google-Smtp-Source: AA6agR6JgVlJL1OQ1dHu16ZFwzfOVaCs9WRMu9SxS7wPlF10OqfSQbT0Tuxch+bZuE0sgwXzOjFD3w==
X-Received: by 2002:a05:622a:305:b0:343:5601:d5c4 with SMTP id q5-20020a05622a030500b003435601d5c4mr584385qtw.130.1662499781031;
        Tue, 06 Sep 2022 14:29:41 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id u17-20020a05620a455100b006bc0980db76sm12993812qkp.126.2022.09.06.14.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 14:29:40 -0700 (PDT)
Date: Tue, 6 Sep 2022 17:29:39 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 prep/b4 send feature request
Message-ID: <20220906212939.7numvfo6ceenwtfy@meerkat.local>
References: <Yxecq5DHE5oW0XJD@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yxecq5DHE5oW0XJD@google.com>

On Tue, Sep 06, 2022 at 12:16:59PM -0700, Dmitry Torokhov wrote:
> Hi Konstantin,
> 
> Not sure if you are taking feature requests, but it would be great if
> the magic that happens after sending patches via "b4 send" could happen
> on demand.
> 
> The reason is I am using OAuth2 when authenticating to Gmail to
> send/receive mail, and b4 does not support it, so I tried using "b4 send
> -o ..." followed by "git send-email ..." (and I was able to set up git
> send-email to work with OAuth2 tokens), but in this case the magic does
> not happen.

Yes, this sounds reasonable -- I will add that in.

-K
