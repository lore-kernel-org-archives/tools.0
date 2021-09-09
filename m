Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBFF3FF0
	for <tools@linux.kernel.org>; Thu,  9 Sep 2021 15:00:43 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id x5so1632072qtq.13
        for <tools@linux.kernel.org>; Thu, 09 Sep 2021 08:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L0SJJH6KsAuBecw7sib0mHtjkxy6V/ChAAtJ45vJRik=;
        b=ajc5KdsTFkIQhy7+lmYgw9sl+xuxOHZrdKpEnP2f7GQLif7nHVkVFXg6cFLApwdBJH
         Awlvsru3pmrOruEBtY6pArLkTn+8DsNBLolIHYpdKrkoPcfivdcermRl40X96WpY4Ly6
         Y2MNed7DOS0gzgj66i8JEYvNisUn7/Sb7z4Ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L0SJJH6KsAuBecw7sib0mHtjkxy6V/ChAAtJ45vJRik=;
        b=MWKrZ+tNiY/E9HdFwzVlXB1GCtLYOwJs0lob04p3txvwEPZOfs6mA8wM7aYOYtFb78
         hQeHEXxaj37jn/ASBd6HNRBJZaDi5mwvKJa//5r1ijSlNJFfddXQCov6Cl3M6kXoC10I
         shyuWiGnAGCotRCIYVwhHWPn07t5J88BVD3jMIbLB41pEDuYj7JUuBLrnPfqAcT+K+ba
         xqzJqbxT6POPHaAR8HSnjdEge0pmaF/9GU5/5HVTTl4gSqru1CMv+rSllSPsDtdliJ3G
         xtw8Bx0MQDju1OBUs3soPvMSTGbsZ55OHAtDtxxq70wm/tf8VZlSPAolLlvxDNl64fAG
         xn+Q==
X-Gm-Message-State: AOAM532EYvN3l+Pg5P9g24fhBgPM3FPcXSElgEET+RN4R8PnKEY48k5s
	f2LCL9UMJiTRFIiWxTtB8dCPsA==
X-Google-Smtp-Source: ABdhPJzTz+Yu8ftVfKh6QO0/S0NlrFbudTuLT87tApTvzrvHoqRkdHxduAL3Dgqv6kBp/izyd3+9yg==
X-Received: by 2002:ac8:578e:: with SMTP id v14mr3215276qta.285.1631199642091;
        Thu, 09 Sep 2021 08:00:42 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id s6sm1496170qkf.80.2021.09.09.08.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 08:00:41 -0700 (PDT)
Date: Thu, 9 Sep 2021 11:00:39 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Lee Jones <lee.jones@linaro.org>, Steven Rostedt <rostedt@goodmis.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <20210909150039.eyzojexy6okfae7u@meerkat.local>
References: <20210902201402.bbdttirbb5ckrtiz@meerkat.local>
 <CAK7LNAQogtzDbAFDtRt7UvDkH6K4tkQgwfmu-2_0rGgo_Uj_iw@mail.gmail.com>
 <20210903152143.nt5mzgwprltl36pa@meerkat.local>
 <CAF2Aj3jbU_vnKvYB2EJXuKdTCeJx3dgZY2h7sriJX4fP6Fsteg@mail.gmail.com>
 <20210908183746.iancht34j3drun77@meerkat.local>
 <20210909084907.271b6df5@gandalf.local.home>
 <YToM6bH/I9rHQMeE@google.com>
 <20210909133840.hezwxmojt4o6lm7o@meerkat.local>
 <YToQEQPcjU5RUww7@google.com>
 <YTofYpb5U1cn66M9@piout.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YTofYpb5U1cn66M9@piout.net>

On Thu, Sep 09, 2021 at 04:51:14PM +0200, Alexandre Belloni wrote:
> I did use the stdout piping to git am until I have seen someone on a
> mailing list adding this to .gitconfig
> 
> [alias]
> 	b4am = "!sh -c 'b4 am -ctsl -o- $1 | git am' -"
> 	b4am1 = "!sh -c 'b4 am -ctsl -o- -P_ $1 | git am' -"
> 
> and then you can directly do git b4am <msg-id>

I intend to add a command to just apply the series directly if all the
prechecks pass:

- attestation is good
- applies cleanly
- no trailer warnings

The fact that folks are writing such aliases tells me that this is needed and
I should stop avoiding modifying the working tree.

-K
