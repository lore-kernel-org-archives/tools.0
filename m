Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380DA2C9C
	for <tools@linux.kernel.org>; Tue, 18 Jan 2022 18:28:40 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id bt14so95449qvb.13
        for <tools@linux.kernel.org>; Tue, 18 Jan 2022 10:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dFTZuY3b5wyF4FYba0i/qJeDulWv6kE5/Va+O0eYiuY=;
        b=Wmvv/FZdEbKZtCK/1UJW9LhPmMXfTzcuahbFmFU3UyG3AO6cUshca6dSJTQ4D3Y7wd
         8IsnrpwKkibnvm6ujKaGvl29kxfePWNfZIND+66INHxVUUJiD5B3BeBn7Q5sUhx2P21P
         L8e2Bpwz3wVbnU2wKFQHwaw00JDwAJZessQJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dFTZuY3b5wyF4FYba0i/qJeDulWv6kE5/Va+O0eYiuY=;
        b=qK5ACoPLtnwxXLEpTfajO0mVgVMKJgkxdNFg9Gr5azEdtg0gLXT1sKbHTkYMjCfRx+
         Vn9cPtrgQwhXskt4mEj7NpdSxxD0EHsZ35I5LqE1oshf3HwMXg/bQk1y+b7bXL6T+oyq
         rJMURCFU8vcqi/B23l/DrdQIJe8EoMkrEs08ICweYkNsEy/RYOYh71DqzwlCXthkwGys
         qCbS3aaRsBI8eWufwlBdNxeQ1cRiv+7JnucPVSCpH4YuH49jej17kve5EL77vFibm8pg
         /YI+YAvazwF4eGGhe9Q/LCHgq7maPL8vfvTNB+LYbA09YFh4HKeIstSFCaSnYTLFroaa
         OcCQ==
X-Gm-Message-State: AOAM532osImUmeJRHIf8XiAUuSnO/XAhbLvboUZAK9/JxyTLboqFcGNe
	W1AFzfeDwOTdnGrXVwfneDi2Ww==
X-Google-Smtp-Source: ABdhPJypnSo2ZQ7lBzUsStU6MW6EDynpLjC+e4GlFGKcWyi6h4wbIOVh4n4FOMHM9jn+M0s+KX7Dgg==
X-Received: by 2002:ad4:5dc5:: with SMTP id m5mr20268807qvh.9.1642530519031;
        Tue, 18 Jan 2022 10:28:39 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id d10sm1402111qkn.10.2022.01.18.10.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 10:28:38 -0800 (PST)
Date: Tue, 18 Jan 2022 13:28:37 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: David Vernet <void@manifault.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [PATCH] mbox: Add support for proxied https connections
Message-ID: <20220118182837.6wgyzp3brztqccvk@meerkat.local>
References: <20220118174144.2445150-1-void@manifault.com>
 <20220118180006.7slmzgm6jrvfaeeq@meerkat.local>
 <20220118181431.fzyciytpgoiruhh5@dev0025.ash9.facebook.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220118181431.fzyciytpgoiruhh5@dev0025.ash9.facebook.com>

On Tue, Jan 18, 2022 at 10:14:31AM -0800, David Vernet wrote:
> Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote on Tue [2022-Jan-18 13:00:06 -0500]:
> > Hmm... I'm not super keen on this addition, because git has a lot more than
> > just http.proxy setting and supporting all of it would be a huge pain. Is
> > there a reason why simply setting HTTPS_PROXY environment variable is not
> > sufficient for your needs?
> 
> Understood -- using HTTPS_PROXY works perfectly fine as well. I thought
> this could be useful to allow callers to configure their git environment
> and forget, but if you're worried about it being a headache to support it
> then it's OK with me to drop the patch (it's arguably nothing a bash alias
> couldn't solve anyways).

My thinking is that it's best to defer to the way python libraries expect this
to work and only look at git configuration when actually touching git or when
looking up things like gpg binary paths. If we implement looking at
http.proxy, then we'll also need to consider supporting the rest of
http.proxy* configuration parameters, and that looks daunting.

Besides, there may be situations where people have http.proxy configured
*just* for git things (e.g. they have some kind of git-aware caching proxy --
I'm told they do exist) that doesn't necessarily work for non-git requests.

> > We already track REQSESSION as a global caching var, so we don't need to
> > introduce another global tracking var HTTP_CONFIG (it's not saving us any
> > calls to git-config, as we'll already only do it once per b4 invocation).
> 
> Good point. Thanks for the review + suggestions. If the preference is to
> just use HTTPS_PROXY then we can just consider this patch withdrawn rather
> than my sending a v2.

Sounds good, but if you want to sent a manpage update to mention HTTP_PROXY
and HTTPS_PROXY env vars with the link to the python-requests docs, I'll be
happy to accept that. If you do, don't bother with the rendered manpage
source, just edit the .rst and I will regenerate the manpage on my end.

Best regards,
-K
