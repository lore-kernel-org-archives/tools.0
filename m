Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA3D4400;
	Fri, 23 Sep 2022 16:47:44 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id l10so679678plb.10;
        Fri, 23 Sep 2022 09:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=486JDvYEUbxKyDG5YNXkeoGMZkTwJrv9NJ76gWB/xYc=;
        b=q7wkwoK7lkX4pj3nLjkG/c8jpTHebAkma6rcDTUeiCz4rfRL/xVN5xP9WMHXiWruKT
         MUaaMZZA6KXuLFBsg+7SSA7haSINUlJMh4RRP86WvrDhjv2DNtRvF31/fYW0dRw+fcnD
         dCbYbxMgvIsaK5Orerw49jmvP8EbEq1t9URCEfgCTKFR4QfR7HIjN0eqdq62ckdKGFhH
         o+u8ais1W8vSJgvZDbmLzlnoQqEKODrjW8se/bT0WoHjjlSNUYlsqL0YDD77FMDST46L
         5/2lsTBHc6AMX0OjpAvr991wBBxbjUciv0gyYBv2R4L9cVKbH7NmM08mrrOb1YunI43Y
         zu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=486JDvYEUbxKyDG5YNXkeoGMZkTwJrv9NJ76gWB/xYc=;
        b=gD3O9/eYo4PrOjYx4CXZgfXNeTwPgzhj4sIFIn0lJ4cFGNC9u6X+ANEP/KdpgN0su1
         SRmCaP1DFdp06EMEZbt4NhIRKDi/c16G72oasdFSX+hFexSvRSfyqXCLanVmjubLgX+q
         63ovNz5jKF9mVqw0XlYoejp4KzpfEFfkAewQoPY8WY7s0U8TcGsw20Qmz4JAHjwNFcE3
         SVv61da1M+5Ji3AXv0625WTHOcuBubSrc6WCDIw1PqKPx2sSbOhsLKalpIlkx8hZK5gv
         SYhm4IMgqjp5GlQpBpg254TElN2q/E1OVnhnM0UmVnWeMfjOZr9xyj4AXkGEzNK4eOCc
         zx0Q==
X-Gm-Message-State: ACrzQf1uQK8q3zfUzXL11XQaNQU4Nq9sswA6d+XMji82C+PBDZ7C2tjQ
	xd6b29p0maNJLzp3sbzb6yI=
X-Google-Smtp-Source: AMsMyM64GDERGGhhB6qzuWWf/MCDx86HPZF/uecFppS/b2fuvdE1azdUcedHJcdGOlRo4Q13lUK4ug==
X-Received: by 2002:a17:902:e402:b0:176:e82f:3f4 with SMTP id m2-20020a170902e40200b00176e82f03f4mr9459086ple.107.1663951663501;
        Fri, 23 Sep 2022 09:47:43 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:8b46:be3c:2c54:68a5])
        by smtp.gmail.com with ESMTPSA id i22-20020a17090acf9600b002008d0df002sm1792100pju.50.2022.09.23.09.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 09:47:43 -0700 (PDT)
Date: Fri, 23 Sep 2022 09:47:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 is having trouble with unicode emails
Message-ID: <Yy3jLFwqnUrfWSno@google.com>
References: <YyzPSrTcGliahL+a@google.com>
 <20220922214840.fw7kdyjidsp2g4vi@meerkat.local>
 <YyzasbZ80Osek12a@google.com>
 <20220922221138.52m4ghjv6gyoaxni@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220922221138.52m4ghjv6gyoaxni@meerkat.local>

On Thu, Sep 22, 2022 at 06:11:38PM -0400, Konstantin Ryabitsev wrote:
> On Thu, Sep 22, 2022 at 02:59:13PM -0700, Dmitry Torokhov wrote:
> > > The latest master/stable-0.10.y should have handle this properly.
> > 
> > No, if you look closely in my log there were 2 invocations, one with
> > 
> > 	--to 'Marek Behún <kabel@kernel.org>'
> > 
> > which dies with UnicodeEncodeError exception, while another, with
> > 
> > 	--to='Marek Behun <kabel@kernel.org>'
> > 
> > works properly.
> 
> Sure, but the problem was as I described. If we properly parse the --to
> parameter as a header-like email address, as opposed to just expecting a bare
> email address there, the fix does the right thing.

Ah, I understand now.

The new ToT does work for me now, thank you for fixing this.

-- 
Dmitry
