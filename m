Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EC22FAF
	for <tools@linux.kernel.org>; Thu,  9 Sep 2021 13:45:57 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id g74so1394534wmg.5
        for <tools@linux.kernel.org>; Thu, 09 Sep 2021 06:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qWw54NFUxPqmWuB2wCHCRIVowygqDsJH7h2qzod4Omk=;
        b=YTYRv/2g9r/ROGEfSXhj/PkKq7206lmAg/Z84/2oGYWqHCg5HiS7ife4AKKAb2lv0f
         vfAq+jGzRccpn7JhbR4k5ossLOvERcC83WB50k4iUgawXR9nqZA/DV+Inqjv5PU0YsiA
         4/alNxv9QA3+ZoJMLZB1guCzguBduPFPVuhUwN6zknU64umikW3/8iCXqJZLM2u7BEVO
         nZsZY5ESsfYYHnX38ItBldhoAOFkDyV+1QZcNZaqIiFtU5EE3qzhdL30/HbFm3xIRW5O
         HtfOcLp1kVL1mGcW+J12jWPVShK4sOHYixkX2B0XMB0Izq3xFWKiJVyYT+U7/R1Pq1vO
         QnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qWw54NFUxPqmWuB2wCHCRIVowygqDsJH7h2qzod4Omk=;
        b=5NvTnl4naS0X+pO/evkbyeYnDD0ErBX02quFZm5ge/1WL+vvOfuJITzAlRiyA9lRGC
         Wg/swa6Sg9oQ83QJ1rB7CIH+dTk0gG8FiHf/hafVZO/EoAm/ly5AEpwMDnS98fbWvhbB
         qU8Yj1j0tTYYkyv4q+HffAf2jUGxvn1ND527H0a3Ze8Gv0H/h1+5o/cmZjMtAZdfkwfy
         dLIndfz7/w8sRN8gRImOunSgDt4xXOJFCI5IRjUgAacKnQY5XA5pV5Neksm+vfrPS0oV
         2PnvFzVlyjj6x6V35cGSvnsMh2icD2orEuaIx09aKXXBGpHbu9Ysh9Bikgf/GM/WQEmy
         6TaA==
X-Gm-Message-State: AOAM530MjBfb7eaEMubUF5DJQe6yXIwNyihhPdh+QGNGgCscgVanyvBC
	13PWJMfTgoSvT2ReQUrn2HZebQ==
X-Google-Smtp-Source: ABdhPJzG2vfdAZFPuAYFvBG6BcjEK7QFV6otv1z5HPH7rzxG5R0JsWI9mEXmh0v4cb4mMkmMcgIaGA==
X-Received: by 2002:a7b:c1cf:: with SMTP id a15mr3158916wmj.85.1631195156154;
        Thu, 09 Sep 2021 06:45:56 -0700 (PDT)
Received: from google.com ([95.148.6.201])
        by smtp.gmail.com with ESMTPSA id z6sm1681201wmp.1.2021.09.09.06.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 06:45:55 -0700 (PDT)
Date: Thu, 9 Sep 2021 14:45:53 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <YToQEQPcjU5RUww7@google.com>
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
 <20210902195332.GA2493828@nvidia.com>
 <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
 <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
 <20210903152143.nt5mzgwprltl36pa@meerkat.local>
 <CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>
 <20210908183746.iancht34j3drun77@meerkat.local>
 <20210909084907.271b6df5@gandalf.local.home>
 <YToM6bH/I9rHQMeE@google.com>
 <20210909133840.hezwxmojt4o6lm7o@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210909133840.hezwxmojt4o6lm7o@meerkat.local>

On Thu, 09 Sep 2021, Konstantin Ryabitsev wrote:

> On Thu, Sep 09, 2021 at 02:32:25PM +0100, Lee Jones wrote:
> > In my current implementation, I have pwclient pull down the patch,
> > apply my SoB and apply the it, all in one foul swoop:
> > 
> >   pwclient git-am -p ${project} -3 -s ${pwid}
> > 
> > Does b4 provide this functionality too, or do I have to script around
> > it?  How have other's chosen to automatically apply the downloaded
> > mboxes?
> 
> b4 am -3 -s -o- msgid | git am

Ah yes, piping to stdout and straight into Git works great.

And with "-P _", it does exactly what I want.

Thanks for your quick response Konstantin.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
