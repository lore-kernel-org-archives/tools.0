Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2922FAF
	for <tools@linux.kernel.org>; Thu,  9 Sep 2021 14:05:39 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id u9so2745736wrg.8
        for <tools@linux.kernel.org>; Thu, 09 Sep 2021 07:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wOVX22zTL7DObKGuCrszi5p0CPfxe+MEWjiJ6h4qd3s=;
        b=wMCOh6Dh8Cfivo539InzLwmhs9pkklO0qYfgnuM1UYmYbxaENjA9XolC4PqPz1+FDl
         THXH5Aj+7+6oCkNHPPUOHMM1QrNU+mMF91uomhtxinHx5ydraEBI0bcqNEFcSSVKM1vc
         M/B7lIDqYfdSMp4w6z9Apd6uyVFOp1OuZ/yf6tQ8kf7lKW3CgyUdpQHgqYTyZKDgsNqE
         O2fkdShXc5nhPzWw4iNwYKD8q0pMi+dzCbaZeW9Vo2J9Fn0hDSToSLy4pZW5sdYZJFX+
         TsOckHQF2wpf3Yz6IK3nK1XYNJsuVo8CIhqe4uu7LMSZOvWopo4FlX9SZSn7ann73kdc
         GUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wOVX22zTL7DObKGuCrszi5p0CPfxe+MEWjiJ6h4qd3s=;
        b=xAqBLICnkGOFVkaoxD9gsfvkwS7kMAyp6Gw1OVgtS0pgXGcsoihRkF1YGL0CqKVo92
         NbYgDDTFulxp5AXiJ+8M7efUVJBfK6Yago/Tu1+dBH5UdL82300UgXlZKepzVXkjueCS
         7J1XZutQNrZcYXkQkoXPIE0CVKqLRV2VZ1T3bsfOzEjbY8vvQVyp+X92DL68qZJiyWQ0
         gLoQPxMgp4bgGIse3Gnu2tKn4B1t9VCedXsqSsTdUr6g7WxOXCjVMorGHOc3eP2jB4rk
         8Uc/Y0nfku+re/C+jbjoG/CNvRIqE/H4D5zQX0t4mpXlVcdozEX5ubDKCLC7ouKfiT1n
         2ckA==
X-Gm-Message-State: AOAM530O69aKhi6nxgQzKX+WT+9/stGptzDCAHaiMmCDoanJqWlqE7GT
	LnkDufi9iSu8NyUFUkzB4LkxXg==
X-Google-Smtp-Source: ABdhPJyPhLBTNBnreBH/ZXKBIRNcxdd1oCPCqJ43pb3vtNYZsEjge69OXRm/5H6GBjPc2JMbUs1Pxg==
X-Received: by 2002:adf:9dc6:: with SMTP id q6mr3739187wre.161.1631196338041;
        Thu, 09 Sep 2021 07:05:38 -0700 (PDT)
Received: from google.com ([95.148.6.201])
        by smtp.gmail.com with ESMTPSA id n20sm1559886wms.15.2021.09.09.07.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 07:05:37 -0700 (PDT)
Date: Thu, 9 Sep 2021 15:05:35 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Greg KH <greg@kroah.com>, Steven Rostedt <rostedt@goodmis.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <YToUr42jJVsGUI+R@google.com>
References: <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
 <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
 <20210903152143.nt5mzgwprltl36pa@meerkat.local>
 <CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>
 <20210908183746.iancht34j3drun77@meerkat.local>
 <20210909084907.271b6df5@gandalf.local.home>
 <YToM6bH/I9rHQMeE@google.com>
 <YToPeUhL+Ro3zlnq@kroah.com>
 <YToR+jmD1TgdQjXJ@google.com>
 <20210909135654.GC5176@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210909135654.GC5176@sirena.org.uk>

On Thu, 09 Sep 2021, Mark Brown wrote:

> On Thu, Sep 09, 2021 at 02:54:02PM +0100, Lee Jones wrote:
> > On Thu, 09 Sep 2021, Greg KH wrote:
> 
> > > I do it from my mail client by piping the message to this:
> > > 	b4 am -t -o - | git am -s
> 
> > Not sure what -t does:
> 
> >   Apply trailers sent to the cover letter to all patches
> 
> If someone sends an Acked-by or whatever in reply to the cover letter b4
> will pick that up for all patches in the series.

Got it.  Thanks Mark.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
