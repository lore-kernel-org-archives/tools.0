Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.4424.1606256879465668552
 for <tools@linux.kernel.org>;
 Tue, 24 Nov 2020 14:27:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bnndSS6i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.174, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qt1-f174.google.com with SMTP id f15so250738qto.13
        for <tools@linux.kernel.org>; Tue, 24 Nov 2020 14:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Ir9nGrpzcQ/wR5QykhOmn7CA5TlQ2duhJ8PhMyzV5ho=;
        b=bnndSS6iVVOMzEnQl3TUILToJmpGhuLijPio6v6jX6jA8CktvUNQrjIt0zYx/9RPs4
         bAkrGph1S9hVPgr47ypv901zJAh9j3CkdSBXnkDTR/7H4UbI2QbHJ/YZOVRCfQ7DHWKl
         y+Z2dmOpdvPBTXb88/M6rfcWDghIl/4e1+u0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Ir9nGrpzcQ/wR5QykhOmn7CA5TlQ2duhJ8PhMyzV5ho=;
        b=G2UNESqJcZiX4XMxbuy6c/1Uhl2g1gI/ZBu2HYWT+Zs98jBHCleR8FBTgZdNIvoahS
         lrrlQEXir+lrPX+R0oZumTbcFo/q7rCQE89aZ7QmlDqbxg7bY+I1/v+H/CyEy9EP5rsx
         w/WlDSdCrQs864iJ3n7fHHtSrK/wW4eDptQE3qIa/vSeYrbfF0ByJlEHcdPUiMzEhRu+
         r8KbYTo5O/pVXGGmY7lFOVp13LnIJ+U/odQiYBtGCKnyzgeidkLMNJpB5Zxtv+WREqsD
         yzpeL42tVYrRhT7+fss4+e9lIghMnqbaoNXDrOZJxP2p14Ck6T0q10aYenUiIDwnJ+4w
         5plA==
X-Gm-Message-State: AOAM533J1yQL0t55KOhOCxr6SqkwMlDQIClDyCQSXnSaATFKe/1v40Yq
	3Vocdkh/nUTAmbkbD3Qy5dcLQw==
X-Google-Smtp-Source: ABdhPJy+2lvqF0j7XoPlyrPoZfph2Ui7V2uiryASk3x9ZiiE3nOuAozptbv5oateFqXBRvjG2HSX7g==
X-Received: by 2002:ac8:43cd:: with SMTP id w13mr281225qtn.391.1606256878511;
        Tue, 24 Nov 2020 14:27:58 -0800 (PST)
Return-Path: <konstantin@linuxfoundation.org>
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id x19sm446707qtr.65.2020.11.24.14.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 14:27:58 -0800 (PST)
Date: Tue, 24 Nov 2020 17:27:56 -0500
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 Cc: lines
Message-ID: <20201124222756.osrv7ixjer6n3f3f@chatter.i7.local>
References: <20201014164747.GM3100363@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201014164747.GM3100363@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Oct 14, 2020 at 01:47:47PM -0300, Arnaldo Carvalho de Melo wrote:
> 	First of all, thanks a lot for b4, I'm now using it regularly,
> great tool!
> 
> 	My previous workflow involved a 'am' script that I would have to
> use patch by patch, would go on it and collect Cc: lines, not just the
> ones in the patch itself, but the ones in the e-mail containing it, as I
> wanted to record that that group of people was actually made aware of
> that change.
> 
> 	Would it be possible to have something like a --cc to have that?

I added this feature to the latest master, but I'm not 100% sure if it's 
doing the right/useful thing. If we only look for Cc: addresses, then 
more often than not we just find mailing lists there:

----
$ b4 am -o/tmp 20201124143848.874894-1-antonio.borneo@st.com --cc-trailers
Looking up https://lore.kernel.org/r/20201124143848.874894-1-antonio.borneo%40st.com
Grabbing thread from lore.kernel.org/lkml
Analyzing 12 messages in the thread
Will use the latest revision: v2
You can pick other revisions using the -vN flag
---
Writing /tmp/v2_20201124_antonio_borneo_net_phy_realtek_read_actual_speed_on_rtl8211f_to_detect_downshift.mbx
  ✓ [PATCH v2] net: phy: realtek: read actual speed on rtl8211f to detect downshift
    + Cc: linuxarm@huawei.com
    + Cc: Salil Mehta <salil.mehta@huawei.com>
    + Cc: linux-stm32@st-md-mailman.stormreply.com
    + Cc: linux-kernel@vger.kernel.org
  ---
  ✓ Attestation-by: DKIM/st.com (From: antonio.borneo@st.com)
---
Total patches: 1
---
 Link: https://lore.kernel.org/r/20201124215932.885306-1-antonio.borneo@st.com
 Base: 9bd2702d292cb7b565b09e949d30288ab7a26d51
       git checkout -b v2_20201124_antonio_borneo_st_com 9bd2702d292cb7b565b09e949d30288ab7a26d51
       git am /tmp/v2_20201124_antonio_borneo_net_phy_realtek_read_actual_speed_on_rtl8211f_to_detect_downshift.mbx
----

Is it better to look both in To: and Cc:, or did you specifically intend 
to have just the Cc: header copied into the commit?

I'm also a bit worried that on some patches the Cc trailer list ends up 
fairly huge. Is that expected and okay?

-K


