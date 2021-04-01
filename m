Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C7A259E
	for <tools@linux.kernel.org>; Thu,  1 Apr 2021 21:25:58 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id t5so1716532qvs.5
        for <tools@linux.kernel.org>; Thu, 01 Apr 2021 14:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=R8APVMFq6bWzQ081tA+8R2mv2uMmOGvERS00NaycroQ=;
        b=K12Xmpo+YBX3wDRKvPkO1PKyXygDPd9mgMQ1kN8sEhuOOfG4dFCFixsJHCIXP0BWMg
         gRu0UJRXNIlcOe3Di3NzjMzAFzHg4M1knGF1w8EnhCe6dwZ1aIR2312634vlaCM7EJbp
         Vrezc8kut+SkE4fJ/om6nWMZGpCVTDoeU7gBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=R8APVMFq6bWzQ081tA+8R2mv2uMmOGvERS00NaycroQ=;
        b=aa5PKX90DYtshKsygsbtDZ/kX20eNjPwoeTpdbMTVvlWQiA7osFOlbsCoP9/abtsok
         rfMg0fRWoM0HgzrW4Hmme/1m3XM/H5nXeYXG99cbi/u21gAVU2p9uleyGDTq/nGNmqUG
         kp/q7/cyxrIf5nLAFwpIZnQi5pF9hibjR7ckHCrQIL2oD27QO7JOQjYztcqBYded0a3S
         PBMGTEZ6kXbgMD9eUnNBDMh3Ko9ENr5l8+248C7/X3h3uw0Lqhrw5rz7DtmVT1IKXPg2
         Fh4USMp0hXKI9KER8/mWYFmmRf31egBwldEqB1SiYB8QJnP6gASx7b/xlUVQaS5nYpa2
         0zfA==
X-Gm-Message-State: AOAM531YuBC6WXM0eJHSZAWR66deChe6yKf1gUkEUoAezihnMsJhHpgi
	kchKUCKXstgnE19pWMjV8HmXjnemMZrKahPWzrw=
X-Google-Smtp-Source: ABdhPJwT1pGd57NQRt3RLqY5z3XTOG8DL2TsJjYNqacJi4KLvf12AZMzxT51IqxyahEsFuATs4ZpWA==
X-Received: by 2002:a0c:ac4c:: with SMTP id m12mr9923271qvb.35.1617312357234;
        Thu, 01 Apr 2021 14:25:57 -0700 (PDT)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id j12sm4422598qtn.36.2021.04.01.14.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 14:25:56 -0700 (PDT)
Date: Thu, 1 Apr 2021 17:25:53 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: Lore link problems with lossy lists
Message-ID: <20210401212553.wsaqzxfwf45tf7cx@chatter.i7.local>
Mail-Followup-To: James Bottomley <James.Bottomley@hansenpartnership.com>,
	users@linux.kernel.org, tools@linux.kernel.org
References: <13b77ad8f00b5590baca6203cc7b073df477e993.camel@HansenPartnership.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <13b77ad8f00b5590baca6203cc7b073df477e993.camel@HansenPartnership.com>

On Thu, Apr 01, 2021 at 10:07:34AM -0700, James Bottomley wrote:
> Put more broadly: when pulling up a thread by messageid, could we get a
> redirect always to the entire set of replies lore has even if they
> traverse multiple lists ... forget the lossy list problem, annoying
> people drop and add various lists from CC's all the time, but in spite
> of this I would like to be able to see the full thread.

Soon (TM).

https://lore.kernel.org/workflows/20201201184814.GA32272@dcvr/

I expect this feature will be in place within the next few months, and not
just in b4 but for all lore lookups.

-K
