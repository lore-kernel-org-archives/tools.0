Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51A13D666F
	for <tools@linux.kernel.org>; Wed, 25 Mar 2026 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443057; cv=none; b=Fsh5mhUqv3yTXs7e6mq22gVXCj4gSr2wuoRE9itcKG6qIL+ByAGr8T/FPOinV+ekDRBM3MiEfrFLV97Udt0pRT+4mFj4GhNFFYuRVLuNRiWJJlyaiwsjI5Kn/jxZRN/J0s/8d0xfs2oSnaluuelo3/+3bYxVFgUc9PFeM8Z+NKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443057; c=relaxed/simple;
	bh=4GV5ThKV6MI+d2TxbkY87jeyq+X47JJSFFyfvIieStE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kvH8gjJz2p7SM02kZESi6zSVBCJtZj7PatE8qHHRdbIRSHX5oxUUFMzNVG3n93dwRJ6qdgWizUv2onNJE9BXrhe1B7T5Z9Z0j6cRHAnJlalqGCYx9aA131RY4grBRIbXfxwc8OFWE+QbuzJojLroruUOaShtRGc6c5zMHCSpmrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=ORgstK4Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="ORgstK4Q"
Received: by smtp.kernel.org (Postfix)
	id 493E9C2BCB0; Wed, 25 Mar 2026 12:50:57 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C635C4CEF7
	for <tools@kernel.org>; Wed, 25 Mar 2026 12:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0C635C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from macsyma.thunk.org (172-245-102-52-host.colocrossing.com [172.245.102.52] (may be forged))
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 62PCoVbh016618
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 08:50:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1774443035; bh=nBKPSePJiObfH5Gh45zzi6wDlUbyQft9NAEiMdAOO9A=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=ORgstK4QPFttHGVtUYnRy88a5A88I/0HRjsbDNzEXC/qudDENUx+s80m2m39ZVGxu
	 h78gTR4S4QZWfOv0F39WFS6yuZQGyQOvtRONpqJZgIRV2esQgUvQF6wXY+iAUxMY8k
	 cjlLGIwFow3Gy9eOKDoZexLJ6+ZgnT/MaCcBon6Vc2RX5ggAIkh57kUAUT3K7jZ0b7
	 s54rZF2UC9FBv6yhGcgMKjdeKV+vUfncBOC8e53grpVJMNSyLmkTphswLrAqdFESBJ
	 S8UNcOnAatZmGK2mG2z9l4Co5eTdWC/y7HUsD8sBm6k+qYF37o68FQTNwDn6LWen06
	 rAYzLjoZFbN+A==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 19E605F3C45E; Wed, 25 Mar 2026 07:50:29 -0500 (CDT)
Date: Wed, 25 Mar 2026 07:50:29 -0500
From: "Theodore Tso" <tytso@mit.edu>
To: Borislav Petkov <bp@alien8.de>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, users@kernel.org,
        tools@kernel.org
Subject: Re: b4 v0.15.0 released
Message-ID: <20260325125029.GA2107@macsyma.local>
References: <20260320-portable-jaybird-of-focus-41fd66@lemur>
 <CA+JHD93MSC=GZMscAu8-uMroXYrHzn-w8NgHVSLyjNLJ9Wa=OA@mail.gmail.com>
 <20260324-shapeless-poised-turkey-f7b7ec@meerkat>
 <E6DFA188-6979-49A3-82E4-F673A6E66994@alien8.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E6DFA188-6979-49A3-82E4-F673A6E66994@alien8.de>

On Wed, Mar 25, 2026 at 10:19:19AM +0000, Borislav Petkov wrote:
> I hope you guys are planning on sending the sashiko reviews as
> replies to the patches... eventually, ofc. Would be useful.

There's a thread about this, but channelling the Sashiko team (it's a
separatae effort from Konstantin's b4 project, nb4 is just using
Sashiko), they want to get the false positive vs useful detections
rate to the point where the reviews won't be considered annoying, and
then it will probably be on a per-subsystem opt-in basis.  There's
been talk of having an option about whether the reviews should go to
the maintainers and the patch submitter, or whether the subsystem list
should be cc'ed as well.  But all of this is still TBD.

Cheers,

						- Ted
