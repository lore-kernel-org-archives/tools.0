Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2162F29CA
	for <tools@linux.kernel.org>; Fri, 16 Apr 2021 21:26:54 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id s5so21606868qkj.5
        for <tools@linux.kernel.org>; Fri, 16 Apr 2021 14:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=AUkiGM2FUXCR89jtbiHq3B7K6EzfQT7uCfH1gevpRr8=;
        b=Km9LlKkMwmPESAYIKEdToicXL+sljLvI2BIYKkmSuAIe+XzaRJBT+zp5Z1N5QCIn8e
         XUliZFwZAOY/sxPiQ7uP23E9P/wYE6Zk4qqeMHULAVa/qbD09WuFc/EADotdctx7n3kx
         Kdsl+IR47dL7WLAAlsOrlRuLLVe51DPOgHhJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=AUkiGM2FUXCR89jtbiHq3B7K6EzfQT7uCfH1gevpRr8=;
        b=MBrAhuBzYdDGMY9hDga2VVxYbdxxv3s3kaLsmRZqTMuKADuXms4yc5ofyk4z8UDBLX
         /C8NgCMcvwe0dHqy5ZE2WyR2GykxhXy3Bo3Wkv1QHycjFCa4awhbElKd9Q1TVtc9zWXK
         zIyVu9au0CSOF/dxZINW7fhU07mW+kAQO2hFL6WKHt7ijjNat9y+6URcD3UuIjBABH9d
         YAzibpuGvmblpuDmsgA+d8OlKVJFcRHnsCX8q0rO2fCaAEkUkGH+iN4FwagClUcfND+X
         IWSdFbMp/QWkWDqO5HkdEgLmzaQyZbtwKR/OW7vAYssg4l4rnI+ARivRsl51gaxlArX2
         zZiQ==
X-Gm-Message-State: AOAM5336fwWie83+LNf4neBpBVCT4C2RDw51kkJ4bipemfd7MO4tEUId
	0e61uHROFKtM3Zt1QwmWJ/EKPg==
X-Google-Smtp-Source: ABdhPJwMZCd3C1iKJvKN7qDL9YjoQ8jFG/z5X8rDOsoyaNG+EyGSgaBClplXcR/AOzpe9y3wt27liA==
X-Received: by 2002:a05:620a:e1a:: with SMTP id y26mr1334008qkm.280.1618608413145;
        Fri, 16 Apr 2021 14:26:53 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id d22sm941076qtn.44.2021.04.16.14.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 14:26:52 -0700 (PDT)
Date: Fri, 16 Apr 2021 17:26:51 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: Subscriber actions for migrating lists to lists.linux.dev
Message-ID: <20210416212651.rrs3j5xkm3n6gniz@nitro.local>
Mail-Followup-To: James Bottomley <James.Bottomley@hansenpartnership.com>,
	users@linux.kernel.org, tools@linux.kernel.org
References: <cd77ebe2e456cb80527d9634a5469254006528c5.camel@HansenPartnership.com>
 <20210416211615.7serx3oa2rloe7al@nitro.local>
 <7be28063b8fb355fe1e73df6ca8c4db5e2163353.camel@HansenPartnership.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7be28063b8fb355fe1e73df6ca8c4db5e2163353.camel@HansenPartnership.com>

On Fri, Apr 16, 2021 at 02:22:58PM -0700, James Bottomley wrote:
> >  The lists we're currently migrating are moving from other places --
> > either from domains we don't control (lists.01.org), or from domains
> > like lists.linuxfoundation.org where there are MLs that will likely
> > not enjoy mlmmj-style list management and will move to groups.io
> > instead after we cherry-pick the devel lists.
> 
> OK, so for ksummit-discuss and it's ilk I need
> 
> * ^List-Id: .*ksummit-discuss.lists.(linuxfoundation.org|linux.dev)

Note, that the new list is without the -discuss part, just
ksummit@lists.linux.dev, so you'll probably want:

* ^List-Id: .*ksummit.*\.lists\.linux.*

-K
