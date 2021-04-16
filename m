Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07236D3E
	for <tools@linux.kernel.org>; Fri, 16 Apr 2021 21:16:18 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id dp18so9524310qvb.5
        for <tools@linux.kernel.org>; Fri, 16 Apr 2021 14:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=j6Cn/3j/w8krm86kp0hag3Ve4BNUWnoNmbzLLP1t+uY=;
        b=TTncLS0YkjU31DSGs/93FESGj5Kp5ro/ndv4QTlSqrVeDLrcaBUtzdHSNztT6K9OyW
         qI4HRgktiorD578q5ODo4n5+uonzVU+8Xz9s1tm7n8O79NGwSp4PXi/61vt2WVP3i9yO
         wgRm5uhJikKiaeFxzS4suilfiZLBbyNR0jnHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=j6Cn/3j/w8krm86kp0hag3Ve4BNUWnoNmbzLLP1t+uY=;
        b=TgTcJ0qfUZKKwb9dCmLbBgKF5ghTasw1cspBUUpMNJmicDcrh8Zab2zYT6OEftI2Ti
         4LyAyOBbc3IMhI11OuySowomt1JlnWp5nFOUTCtudrRDU6qY1E0pD2/evq4hmiPuHOWx
         5AAxHVvd5Db1531VL7UQ6hO1Ai7+hr5/CoFgW7kM0IIDGLu+qzofwpaER9Jeev8wxuqg
         A1QFMMCvd89W6tYFoTmHBoYWCW+evjEM2DOgEk6/OhWEaMqQKW1QnDaHD272AbTBEtBC
         0msep7Pqd1IoOQDMQ0Guz2hMgF8F1GKR1ZBbN04K/sDbp9HMT9oWKxMw0oITrUa5H+zI
         AASQ==
X-Gm-Message-State: AOAM530ZmE7q/OhE2gBMX1Ikq8tKExtg+ldtI4/jhYxGkav7ET5qTrdz
	w/9JK9HfygrWyvty+ladkY8ntnqYz45coAZguHc=
X-Google-Smtp-Source: ABdhPJwZHFOfZoECohJBWX6q/3UqyAOu7bs+3/xq2FjdnQIXJEMYFWWtaD3jcM/cv5p0UCHePxMrtg==
X-Received: by 2002:a0c:a163:: with SMTP id d90mr4618349qva.24.1618607777854;
        Fri, 16 Apr 2021 14:16:17 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id q125sm5008627qkf.68.2021.04.16.14.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 14:16:17 -0700 (PDT)
Date: Fri, 16 Apr 2021 17:16:15 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: Subscriber actions for migrating lists to lists.linux.dev
Message-ID: <20210416211615.7serx3oa2rloe7al@nitro.local>
Mail-Followup-To: James Bottomley <James.Bottomley@hansenpartnership.com>,
	users@linux.kernel.org, tools@linux.kernel.org
References: <cd77ebe2e456cb80527d9634a5469254006528c5.camel@HansenPartnership.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cd77ebe2e456cb80527d9634a5469254006528c5.camel@HansenPartnership.com>

On Fri, Apr 16, 2021 at 01:58:22PM -0700, James Bottomley wrote:
> I'm fairly certain all I need to do is a bit of duplicate message
> elimination and to update my procmail rules, but on the latter, what is
> the header I should be sorting on?  For current kernel.org lists, it's
> either X-Mailing-list: or List-ID:  Will it be the same for
> lists.linux.dev (so I just add to the domain in the rule)?

We still add both List-Id and X-Mailing-List headers, but as "List-Id" is an
actual RFC standard, I suggest filtering based on that. E.g. for
linux-staging@lists.linux.dev we add the following headers:

    X-Mailing-List: linux-staging@lists.linux.dev
    List-Id: <linux-staging.lists.linux.dev>
    List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
    List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

> Ordinarily I'd just wait and see, but given the volumes involved I
> wasn't keen on waking up to hundreds of emails suddenly in my INBOX
> instead of the list folders.

Note, that once we get around to vger lists, we'll be preserving the address
and list-id without changes. The lists we're currently migrating are moving
from other places -- either from domains we don't control (lists.01.org), or
from domains like lists.linuxfoundation.org where there are MLs that will
likely not enjoy mlmmj-style list management and will move to groups.io
instead after we cherry-pick the devel lists.

-K
