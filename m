Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489FC23A5
	for <tools@linux.kernel.org>; Thu, 23 Feb 2023 09:53:37 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PMpHs1M87z4x7j;
	Thu, 23 Feb 2023 20:53:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1677146009;
	bh=kBPasnWd/+HOAJatGxdqCtwJ3IOXZjGCODHOO0FCXlo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=emUlR5guhHb12X3MyKh+bETyO9Tpab4H6fDZh2/aCD2d+w0VGr7DAu7c80HBXsT0J
	 nGvQGDnoDJ9VhGE4Zb0IrnoDTT3EJybBuUl47ztHhXBlBsDtAXoSecG22Cn+70em+p
	 6B9RykOBjvRjvI0koJ0d7dAqaC8xfj5SHnkjw940WBQ22knSgjzYiFzZFhBGBeZF/P
	 /j4L62Xf0Q5oNOKQgpdPdpPYW+rzb5TThuuw+IFEWevk3Pzm7DxETA/nqlWHCoLXq1
	 nEY+c2+dRCij4/OGfg4hJQ20TkTU8gWR2fWl3DrPsSp++BB6O6zrn11vpLx0q8tiee
	 +jkTblmE9a3ng==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Nathan Lynch
 <nathanl@linux.ibm.com>
Cc: tools@linux.kernel.org
Subject: Re: b4 submission endpoint sender name length
In-Reply-To: <20230222200338.sinridhdzgq2k2dd@meerkat.local>
References: <877cwk9uor.fsf@linux.ibm.com>
 <20230222200338.sinridhdzgq2k2dd@meerkat.local>
Date: Thu, 23 Feb 2023 20:53:28 +1100
Message-ID: <87y1ooaesn.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:
> On Tue, Feb 14, 2023 at 08:40:36AM -0600, Nathan Lynch wrote:
>> Hello!
>> 
>> I've used b4 v0.12/v0.12.1 to submit kernel work to linuxppc-dev over
>> the last couple weeks and it's working very well for me. I have been
>> using the web submission endpoint.
>
> Nice!
>
>> When I checked with the powerpc maintainer (cc'd) to see if my new
>> workflow was causing any issues for him, the only less-than-positive
>> feedback I got was that the sender name set by the endpoint:
>> 
>>   Nathan Lynch via B4 Submission Endpoint
>> 
>> feels a bit long and sticks out in the patchwork UI. Could this be
>> shortened? Perhaps "via B4 web" or similar?
>
> Thank you for the feedback, I've shortened it to "B4 Relay".

Thanks.

> It won't help in
> your case, since the patchwork name is set at user record creation time and is
> then never changed even if the From: changes, but it will help others.

I can fix that as I have admin on patchwork.ozlabs.org :)

cheers
