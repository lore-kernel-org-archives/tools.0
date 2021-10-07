Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F382C80
	for <tools@linux.kernel.org>; Thu,  7 Oct 2021 18:11:42 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A7DCB846;
	Thu,  7 Oct 2021 18:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A7DCB846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1633629961; bh=l65HZ88w+ofnirjsFaMsU9mwp2AnJY1nkKk7KIFs4N8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kiXH+sxnqSqZEHazRikupRS+sOYAUCo7O/TQDYxH0+VA4eoTLvmBHRn+iAXdssO1z
	 QMUa2KQK1irclBXZXRH09qJSlMQrZpgRiEZ25L96pljHGWAB7fCppEca8/aas9lZkI
	 aGXL0UoQA8nzszraGeu9Tagxf0IBXyEsvzyvuL3Mitrw/6qTYGEvNfoijzTxM9d2DY
	 Eds+7/Tk+Lk7kZxGlsk0LPepY4Ssk2oSpTEO773lrRYRq8Y03e4AA/yRCQTtMkvtxP
	 hsJACLWWP5qqshw+O1AXB1eewGBnkTP+AhVQB4Zd0uDIRFcDsHTR1NXqQHm6fbT6nk
	 MW+wcbXFSCF8g==
From: Jonathan Corbet <corbet@lwn.net>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 and git am -s errors (was Re: [PATCH 1/2] ext4: docs: switch
 away from list-table)
In-Reply-To: <20211007173854.v6wy6cpekbv3lf2i@meerkat.local>
References: <20210902220854.198850-1-corbet@lwn.net>
 <20210902220854.198850-2-corbet@lwn.net>
 <20210916095455.GE10610@quack2.suse.cz> <877df9tt5d.fsf@meer.lwn.net>
 <YV8EGFcPtM9u+ihl@mit.edu> <87wnmozy9i.fsf@meer.lwn.net>
 <20211007173854.v6wy6cpekbv3lf2i@meerkat.local>
Date: Thu, 07 Oct 2021 12:06:00 -0600
Message-ID: <87o880zp4n.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Thu, Oct 07, 2021 at 08:48:41AM -0600, Jonathan Corbet wrote:
>> Ah...I learned something today.  If you try to apply your own patches
>> with "git am -s" (via b4 to lazily grab Jan's Reviewed-by tags), it
>> fails, complaining about duplicate signoff lines.  I'd failed to notice
>> that before.  I've *really* applied them this time (and tweaked my
>> scripts :).
>
> Butting myself into the conversation in a totally non-creepy all-seeing way.

You can run but you can't hide :)

> Was that when using "git am" directly, or via "b4 shazam"?

My script is still "b4 am | git am", haven't tried shazam yet - it's
definitely on the radar, though.

Thanks,

jon
