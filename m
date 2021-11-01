Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C642C88
	for <tools@linux.kernel.org>; Mon,  1 Nov 2021 18:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635791909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8G79DyYKXql+j/T7+6tbWA/f2cjU8JcZ+IZc64ebyjQ=;
	b=HQpOpLfwaCLm6wbUHNMSqyMA5Z5fYj+sLhnoeRTaOnK8Q4Z0qg/g1GujOVQwZ93CcZ+rOq
	ztm00VkblbVpV0+/xrtUf9bCnRS+zVU712YKL0FtN+POwriRvRn9CR45ldOiMwYifrSJOl
	CpwRYKIiqaRodSyZ0nCcDUJeYO1mHWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-MlbatiLxMoCWxaWaeYhJxg-1; Mon, 01 Nov 2021 14:38:26 -0400
X-MC-Unique: MlbatiLxMoCWxaWaeYhJxg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F0009F92A;
	Mon,  1 Nov 2021 18:38:25 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.192.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7621D5C1CF;
	Mon,  1 Nov 2021 18:38:24 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org,  tools@linux.kernel.org
Subject: Re: b4: unicode control characters -- warn or remove?
References: <20211101175020.5r4cwmy4qppi7dis@meerkat.local>
Date: Mon, 01 Nov 2021 19:38:22 +0100
In-Reply-To: <20211101175020.5r4cwmy4qppi7dis@meerkat.local> (Konstantin
	Ryabitsev's message of "Mon, 1 Nov 2021 13:50:20 -0400")
Message-ID: <875ytbhgbl.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=fweimer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

* Konstantin Ryabitsev:

> Per exhibit a, what should we do in the situation where we discover unicode
> control characters in an email?
>
> 1. Warn and strip these chars out, because they are extremely unlikely to be
>    doing anything legitimate in the context of a patch (unless someone is
>    sending patches for docs actually written in RTL languages)
> 2. Warn and error out, refusing to produce an mbox
> 3. Just warn and produce an mbox anyway
>
> I'd normally do #3, but with many people piping things to git-am, I'm
> not sure if it's the safest choice.

It's probably best to coordinate such steps with people who use RTL
script in patches.  In practice, this might mean deferring to whatever
mechanisms the Unicode folks come up with.

Thanks,
Florian

