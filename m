Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A58938F633
	for <tools@linux.kernel.org>; Mon,  2 Mar 2026 09:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443858; cv=none; b=pRHMzaUzU1TzpZg7czMzzdkcA+I8PmfvAAXOI0SFwZblc4K8RyEYmxJGWdCCr0qj32+yLfR15uJkqsUNuIxuKFy+2WHCaZ3V9/CbkGdwW7dtFj0YumXQCjeoywiVlBY31D7mA4b/uLVtF8Q21v7NHcdd8zzOE8zBXtVRpVp0pTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443858; c=relaxed/simple;
	bh=8fVsDq1Rk77m4/hLg02X/dVNXFdadOH4eDgJoJotZYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=tnUPCWurWAMd5Z7dvKPA2H88p2OsP4xgQC0Y8CiRZmVFySpXueDWZd1t84Whbx+lzo8u4DI6PSe65Klr2rYIrtCHfCvojBJrZii/TM54DGPxJ9XC7er4sMGF8AdwhHABSLis95NYcWnRq1+tspPK0tUGvT//ituLphy8ENFtD5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bs9cD4oQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bs9cD4oQ"
Received: by smtp.kernel.org (Postfix)
	id 73313C2BC9E; Mon,  2 Mar 2026 09:30:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2FDD8C2BCB2
	for <tools@kernel.org>; Mon,  2 Mar 2026 09:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2FDD8C2BCB2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772443855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JgejE1lC+L6ova0pBfrWhHhJ1YZ8wZqfBfrOYbnIWpg=;
	b=bs9cD4oQCvDWGuMWxDiz4n0Jg57w0EZXsv+Leg6C21NSBtf2G5MwbdwMV8I/3I2Oq5lnAS
	5HJt//HKJZM/xRZcXXvvtb6ImSYYeP3eoNk7G3BaZPaQwfR4I9EAARrCPgWVDqF4erIj1g
	qSUYdferaNh2qKmleoRfpFSSpPoUwdU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-VpopnJ6kMqGhEiM_2GnfXQ-1; Mon, 02 Mar 2026 04:30:54 -0500
X-MC-Unique: VpopnJ6kMqGhEiM_2GnfXQ-1
X-Mimecast-MFC-AGG-ID: VpopnJ6kMqGhEiM_2GnfXQ_1772443854
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4837b6f6b93so30219745e9.3
        for <tools@kernel.org>; Mon, 02 Mar 2026 01:30:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772443853; x=1773048653;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JgejE1lC+L6ova0pBfrWhHhJ1YZ8wZqfBfrOYbnIWpg=;
        b=mf9COBnGsrxY1u7WpwpihD35IOa4ojk0uVIQ7/cEGiywoH0jXac+19ca8JX7zEflzt
         9Q9o+I2CGp8qzUjz4GTALnZFXVvsdnTKjfByvZ+eZEOEv+Cv+GwBG4swL2s8Z/BNg4Bl
         nuRswirx+18LtDQI2poBn3cWFF48qSr7FFxgzzq/XtaM++R0Z8yDJ5fO8FZbgnuK1tvy
         ikKJU1UbNIhkzoc6wGG7LfjoXvI6zt2iQIna0WMKVobAxcKC6IncOMZ6OteYEX/Cwfv+
         bze49xLF7PhlHhGxBdga4TWgqWJ/MlUXNCjMOl0UT1bLXsZeblOWJGBt2nDrKKd2h6wu
         WpEg==
X-Forwarded-Encrypted: i=1; AJvYcCWY1VUS5HwM2hlOkL0X/irDMRXLnLZyMARcKSM598/2bTnKPNWbFh7ilw2u1qgO/LetsN1eCg==@kernel.org
X-Gm-Message-State: AOJu0YyQkaKJ7RpJg/MmnyfE20DyicVYxbtE5hQkB6vtZ7AlEXwwyzdc
	oM1jFCv/fAd3Q0X5l7RYX5anTou7RXaydV76+UtDWWS5gsyvej5OLy6iLxfwqgIkfP9MY+moxxO
	mfFHN1EbViZO/azuczMW2qKYbBEMrYuTESV1ELxHzFP39BF4zDh+x/nC9ZQ==
X-Gm-Gg: ATEYQzzOPssb1zF7rsyMmIJ8uNuiPqzb2Ndy3Ro2bgSbEyrozQzZ2BjtF+nNDPcVJcO
	Enc/fyQPLczAjz9gGpyhwqYZT3r8InIscVOyMjyBDt3T47zpRDn1oNWjbgg9vYF4mZCcu45KKgV
	eJEFEYZKnLAMsMgQvaull3C26YeV2vR7UChnEe5hscLT2UKAruYoF1n6TZ+94baQHHP5E7KRcbE
	8CNsRsQ6LwlSY8JIbR7jF1LzC+EXlzczgVYTY5MerwryH8GKSsyBUzW5/lhed1H943dmdgEdZYx
	h/qmI2NWpBHaM0h8W+JkJefHpRWVl8Gxd5qvAKM4KT0dXfv0C7/RD7RXY1wevf3pWvJQQMPe4aa
	JlF5vVy6ndgdf2tdIRs43KjbeFhMgujQR6XV0npxBHEICQw==
X-Received: by 2002:a05:600c:4f16:b0:483:1403:c47f with SMTP id 5b1f17b1804b1-483c9b942dfmr196349485e9.6.1772443853281;
        Mon, 02 Mar 2026 01:30:53 -0800 (PST)
X-Received: by 2002:a05:600c:4f16:b0:483:1403:c47f with SMTP id 5b1f17b1804b1-483c9b942dfmr196349045e9.6.1772443852756;
        Mon, 02 Mar 2026 01:30:52 -0800 (PST)
Received: from redhat.com (IGLD-80-230-79-166.inter.net.il. [80.230.79.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb776dfsm230378865e9.1.2026.03.02.01.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 01:30:52 -0800 (PST)
Date: Mon, 2 Mar 2026 04:30:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
Message-ID: <20260302035403-mutt-send-email-mst@kernel.org>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260227-imported-aromatic-guppy-ad3dca@lemur>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: knru_aE27D7rM2fYZhWf8byopI3DT1znomib4yqlbdM_1772443854
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Feb 27, 2026 at 02:53:07PM -0500, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> TLDR: "b4 review" is a terminal UI that hopes to streamline a lot of
> maintainer duties. A getting-started guide with screencasts is here:
> https://b4.docs.kernel.org/en/latest/reviewer/getting-started.html
> 
> It's available from b4 master pending initial testing and will be generally
> available in b4-0.15.


OK I just tried the "update" flow, and maybe it worked, thanks!
Though I was confused for a while.
I had this:


Date        Status       Submitter                      Subject                                                                          
2026-02-28  reviewing    Vishwanath Seshagiri           virtio_net: add page_pool support for buffer allocation                          
2025-10-13  new          Michael S. Tsirkin             b4: sparse-checkout related fixes                                                
                                                                                                                                         
                                                                                                                                         
    (... lots of empty lines ...)
                                                                                                                                         
                                                                                                                                         
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
 Subject:    [v8,0/1] virtio_net: add page_pool support for buffer allocation                                                            
 From:       Vishwanath Seshagiri <vishs@meta.com>                                                                                       
 Sent:       Sat, 28 Feb 2026 08:41:22 -0500                                                                                             
 Change-ID:  20260228-virtio_net-add-page_pool-support-for-buffer-allocation-6273c5614ede                                                
 Link:       https://patch.msgid.link/20260228134122.631580-1-vishs@meta.com                                                             
 Revisions:  v2, v3, v4, v5, v6, v7, v8, v9 (upgrade from v8 with [a]ction)                                                              
 A/R/T:      - / - / -                                                                                                                   
 Branch:     b4/review/20260228-virtio_net-add-page_pool-support-for-buffer-allocation-6273c5614ede                                      
 r review  d range-diff  a action ▏ u update  l limit  s shell  q quit  ? help                                               ▏^p palette 




So I was confused: I can see there is a v9 but why is it still showing me v8?
It took me a while until I noticed Revisions below and a while more
until I understood: this is intentional,
it means that yes it is v8 but v9 is available and if I press action
I can upgrade. Maybe putting a * near the current revision will help.
Maybe adding (upgrade to v9 with [a]ction) near v8 in the subject will
help.
Maybe showing "press a for [a]ction now to apply the upgrade" will help.

Maybe automatically triggering the correct action is the right thing?
I wonder why not.

"action" is also very generic. Maybe saying More [a]ctions in the menu will
better hint to the user it's like a ... and worth exploring.

Then I did "a" and I got a list of options none of which is "update"
or mentions v8 or v9. I guessed "rebase review branch" does it
and it seems to, but I have no idea why and what rebase
does it refer to:
                                              ┌───────────────────────────────────────────┐                                              
                                              │                                           │                                              
                                              │  Select action:                           │                                              
                                              │  Take (apply to branch)                   │                                              
                                              │  Rebase review branch                     │                                              
                                              │  Mark as waiting on new revision          │                                              
                                              │  Abandon series                           │                                              
                                              │  Archive series                           │                                              
                                              │                                           │                                              
                                              └───────────────────────────────────────────┘                                              
                 
does it always update to latest revision? rename accordingly?
also actually saying what is rebased to what in the menu would have
helped.
                                                                                                                        

Overall I was able to figure out things, and it worked!
The notes are here to maybe polish the UI even more.
Thanks!

-- 
MST


