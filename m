Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430E8265609
	for <tools@linux.kernel.org>; Sat, 11 Oct 2025 12:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760186367; cv=none; b=oEB/RVPbopi8AuUhc6sczeOMtjPy3QvcyRKVvJNTKCJAztg+7w4u0GNBqvFB6akFx7w9gMBnkj+eDBlW83r2jfEOYJFZQUMWm0qhK4IB9w1Hxgc3uv3zM+E8jLmYe4fDT9UyswjMBngKxMJEGjuffcNB4FWr9zsbpIhXjPu+apQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760186367; c=relaxed/simple;
	bh=U4hBSUXASDzSUNNEYURkALRLjFr55jkm7GKiSqh0VnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFvr1VgLtI/PE6XqLzYFUH6w+TjkVro7/PDXx6FbgwFNGjk2CBTqs/h6/u9AP9K911HaDw6u9vSHJq7G/bBDxv/OWo/M/eBiDToSqQe50i1EHav/elZsj66g/BL0Ptp9lPYnu85Hv891tAFGsL99+97ievUirBbbZF/BFdBoJiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=P/MIR/RO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="P/MIR/RO"
Received: by smtp.kernel.org (Postfix)
	id D9C8AC4CEF8; Sat, 11 Oct 2025 12:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3745DC4CEF4;
	Sat, 11 Oct 2025 12:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760186366;
	bh=U4hBSUXASDzSUNNEYURkALRLjFr55jkm7GKiSqh0VnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P/MIR/ROYzhWQ37WMl6TO8TOc8+rQDlvDJY0ppMNIDM134gbrI41Qjxntl/bmD+XM
	 K8TQy226zWvt35mtZFCqvuLkfoMfeWxJOR2P72Yo4kqQeK/x7w3z9Y1atpLASDJC3f
	 bAM2FR378sa4Rv/MGaNz5aFhzrRLWOhnWV58OXFk=
Date: Sat, 11 Oct 2025 14:39:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: [b4] initial "b4 dig" to supplant Link: trailers
Message-ID: <2025101125-supper-fable-e127@gregkh>
References: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010-muscular-camel-of-acumen-00eeaf@lemur>

On Fri, Oct 10, 2025 at 04:47:27PM -0400, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> I just committed the initial implementation of "b4 dig" that will hopefully
> make it easier for maintainers to figure out where a commit came from now that
> we're actively trying to phase out Link: trailers. For now, it only does
> "b4 dig -c [commitish]", e.g. taking some random commits from today:
> 
> Matching the exact patch-id:
> 
> 	$ b4 dig -c ce740955b238761ec1d8cf0590d7e6802d3a813a
> 	Digging into commit ce740955b238761ec1d8cf0590d7e6802d3a813a
> 	Attempting to match by exact patch-id...
> 	Trying to find matching series by patch-id 469ebf2cf560b32106f206e389752deb5f741b6d
> 	Grabbing search results from lore.kernel.org
> 	Found matching series by patch-id
> 	---
> 	This patch is present in the following series:
> 	---
> 	  v3: [PATCH v3] dt-bindings: bus: renesas-bsc: allow additional properties
> 		  https://lore.kernel.org/r/20251009183630.5451-2-wsa+renesas@sang-engineering.com
> 
> No match looking up by exact patch-id (and trying myers, then histogram, then
> patience algorithms with no success):
> 
> 	$ b4 dig -c a29ad21b988652dc60aa99c6d3b1e3d52dc69c30
> 	Digging into commit a29ad21b988652dc60aa99c6d3b1e3d52dc69c30
> 	Attempting to match by exact patch-id...
> 	Trying to find matching series by patch-id abc964d5d53674450f7e553bbe031edc61ac3308
> 	Grabbing search results from lore.kernel.org
> 	Nothing matching that query.
> 	Trying to find matching series by patch-id adf0918395a1a601a8d54d7d26446aadfb6101c2
> 	Grabbing search results from lore.kernel.org
> 	Nothing matching that query.
> 	Attempting to match by author and subject...
> 	Grabbing search results from lore.kernel.org
> 	Found 22 matching messages
> 	---
> 	This patch is present in the following series:
> 	---
> 	  v3: [PATCH v3] tpm: Prevent local DOS via tpm/tpm0/ppi/*operations
> 		  https://lore.kernel.org/r/20250829175152.9704-2-daleksan@redhat.com
> 	  v4: [PATCH v4] tpm: Prevent local DOS via tpm/tpm0/ppi/*operations
> 		  https://lore.kernel.org/r/20250902142429.14041-2-daleksan@redhat.com
> 	  v5: [PATCH v5] tpm: Prevent local DOS via tpm/tpm0/ppi/*operations
> 		  https://lore.kernel.org/r/20250915210829.6661-1-daleksan@redhat.com
> 
> There are known annoyances:
> 
> 1. We don't currently weed out AUTOSEL/stable backports, so older commits may
>    end up in lots of false positives for now. I've not yet figured out how to
>    avoid this without hardcoding it to be kernel-specific.

Because it's not weeding out anything, it seems that any commit that I
pick that is backported just gets confused.

As an example:
	$ b4 dig -c  cfa1a2329a691ffd991fcf7248a57d752e712881 2>&1 | wc -l
	1293

And the end result of that:
	$ b4 dig -c  cfa1a2329a691ffd991fcf7248a57d752e712881 2>&1 | tail -n 5
	---
	This patch is present in the following series:
	---
	  v1: [PATCH 6.1 000/128] 6.1.97-rc1 review
	      https://lore.kernel.org/r/20240702170226.231899085@linuxfoundation.org

Did find the stable review thread, but not all of them?  Is that
intentional?  If you just report all threads it's found in, I'd be happy
as that's what I dig through all the time.

> I'll work on getting that fixed, but for now if you're missing the presence of
> Link: trailers, please test it out.

I'm already missing them :(

And thanks for working on this, if it does end up working well, that's
great.

greg k-h
