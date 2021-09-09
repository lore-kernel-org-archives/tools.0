Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79C972
	for <tools@linux.kernel.org>; Thu,  9 Sep 2021 14:39:40 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id 4so1271404qvp.3
        for <tools@linux.kernel.org>; Thu, 09 Sep 2021 07:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vRqAr7WxiTHAso2+IK6uerlkTWrjETK3lXH6704BAZ8=;
        b=aNVAYlQstrKT7Kndu+rLxxjEjh2VLM8XPjaFHxHVFv/M2tBviAmng9Rv5Y38XTJoCQ
         furgBX4Shtv6nwMRbfaV9CTsoYU88xrc08fjqbqVy+1dwOOLvxoL/uGwHhydsXwBW1qB
         nfaVepYdHUMcF8sOoKo6WGLkFq6AYB/2sLki8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vRqAr7WxiTHAso2+IK6uerlkTWrjETK3lXH6704BAZ8=;
        b=QSCnzT/wS1QN38fqcZ4pcE77sTswX+bWntvehJTrCnsyAaX1cUo24EFPp6wP12B2dv
         TmqtiT7eenjgJHiewflOUJplpFGmeSWnnrjy9JYJG+hzchPSfUgQF5LJEuIFt/0dDoVz
         TEVWARGCtVN121zXTTAzej4wt0DurAYzafXor/TIg3+BjAlUqpOKYLjbfJfT749VciQE
         asDDiTA9ZS5/mkbtebGbqy6LWfNgLPWkbaApAcHsSag6gccdFzDGA9cPMOBNzcy0uZhe
         GdkgyFSumYmq7fU3mMfoyKSPVlEYl7kgyISx0HHaM+ESlX/ZvX9Y+Yf/nd/GxWbxsztt
         92ow==
X-Gm-Message-State: AOAM532CCKWl9I2jT6B76RD76/oycXQyMhlWe7sHABSSmr9+tz/jUhUE
	n8XEAxN+ec/8WWvUQjlYpNFyGw==
X-Google-Smtp-Source: ABdhPJw4NTs/644UTxM6vbUfrglMwdCuWhaQzNGtQDxc13FAwro6AJP60CchUIYN5jJC3ZW3NEILaA==
X-Received: by 2002:a0c:e0c7:: with SMTP id x7mr3279963qvk.55.1631198379855;
        Thu, 09 Sep 2021 07:39:39 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id s20sm1209006qtw.14.2021.09.09.07.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 07:39:39 -0700 (PDT)
Date: Thu, 9 Sep 2021 10:39:37 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <20210909143937.jgppakjxcig7dug6@meerkat.local>
References: <20210902195332.GA2493828@nvidia.com>
 <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
 <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
 <20210903152143.nt5mzgwprltl36pa@meerkat.local>
 <CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>
 <20210908183746.iancht34j3drun77@meerkat.local>
 <20210909084907.271b6df5@gandalf.local.home>
 <YToM6bH/I9rHQMeE@google.com>
 <20210909133840.hezwxmojt4o6lm7o@meerkat.local>
 <YToQEQPcjU5RUww7@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YToQEQPcjU5RUww7@google.com>

On Thu, Sep 09, 2021 at 02:45:53PM +0100, Lee Jones wrote:
> > b4 am -3 -s -o- msgid | git am
> 
> Ah yes, piping to stdout and straight into Git works great.
> 
> And with "-P _", it does exactly what I want.
> 
> Thanks for your quick response Konstantin.

No worries, and like I said -- if you actually need patchwork for tracking
state, then we'll be adding a way to create search-based projects in the near
future.

-K
