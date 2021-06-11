Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9D12FB2
	for <tools@linux.kernel.org>; Fri, 11 Jun 2021 14:17:02 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id u14so13678418qvq.6
        for <tools@linux.kernel.org>; Fri, 11 Jun 2021 07:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OZTKR3yeNjxpBJPMaFpZyVs2Q8cRiVl5tKvigrm/wTE=;
        b=Kx2ffwL/g1mW/jXNpCGR04TLktAr/qWpz5UdtEPg1wZtlLdb09zSBoRW+lTLZLGJ36
         kBXNZ02WUrI4Dw2dTxpHL3eUoTFAK2ZbnxtEboA5KOYseuDT18m4FettyxTr207LP/h8
         djyCsUwpbiSIPfV7BjCXNCzFvoiSXsLHB1Hhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OZTKR3yeNjxpBJPMaFpZyVs2Q8cRiVl5tKvigrm/wTE=;
        b=F1R9XmJyQQzC6bGMikdgq+QTwIYSPN1HG41ffXjs6AVyt4gRx/uH9Ic5NlXwJM8kLK
         bfu0ysjjC4SY4nLWHCZqP1NEDbkRgebCPU8i6znKS7SYSHYLpT4InB2bV5iAJVPbAFkJ
         m4DVuDXwk0AbtugMaUXrgSTKYqCSf3ESjXVoOyVjOrAsx+UvY8w/oECIgzy6jf4/Ui4h
         qIBYSDxUKHx1V5wfAYMAnVAntxvRLgfIH7tBxP9drah137Hk4i3uXKIwQqWIU/5AOGTV
         gNcfxR6+DlOwJxTj+le2600eH5/qhoM5reJVyo38NRj2BiVOv8gZ3rMYmlVgpzoqOj2y
         ZDYA==
X-Gm-Message-State: AOAM530arVzK9HY+R2ygDKfztDLpHuqDj3I9oGKiqnoPxcd9ctFpNiqu
	/OBW2ortTQef7E7kZNNiF03Vz5SOMum8Lbmq
X-Google-Smtp-Source: ABdhPJzVh4HlXSuviFpAqJxcLFNjsBmVIscHx7oAKOSIYQRgrKEk2HlqK7GzwepzOoHS4f+HMVXpog==
X-Received: by 2002:a0c:f582:: with SMTP id k2mr5139080qvm.51.1623421021436;
        Fri, 11 Jun 2021 07:17:01 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id l3sm4168555qth.87.2021.06.11.07.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 07:17:01 -0700 (PDT)
Date: Fri, 11 Jun 2021 10:16:59 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: Multi-patch series broken in b4 master
Message-ID: <20210611141659.kn4duhhqcfjs5vwu@nitro.local>
References: <CAMuHMdWakx2RcL4W_cmUh8s3NYp3darGmrVu11Hq2-sY0GqUPg@mail.gmail.com>
 <20210611123756.zdnyugrvuf2p23hu@nitro.local>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210611123756.zdnyugrvuf2p23hu@nitro.local>

On Fri, Jun 11, 2021 at 08:37:56AM -0400, Konstantin Ryabitsev wrote:
> I'll open a bug with Python and work around this in b4.

Fixed in master, bug filed as https://bugs.python.org/issue44395

> Thanks for the report -- I'll push out a 0.7.3 shortly.

Looks like 0.7.x is unaffected, so no new 0.7 release necessary.

Thanks again,
-K
