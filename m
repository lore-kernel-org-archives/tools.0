Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40A43FCD
	for <tools@linux.kernel.org>; Thu,  9 Sep 2021 09:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631181536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bEsrBogpABYp5wIk4uq0DGi4vFMsovKV5rNr5jWJfx4=;
	b=W7/epo+S2vsdihkITOX/x8hUml14BMMyxnw5y9V6ZJeMcELkZMDWE2JxE35McCDHMT6vc4
	40QpH3tefpAGU0/ob0ycLmJu3nKXMGYL0n0QRZygXODDgzxkh18NApQQg5CRZ1/zd6eWc1
	PxXh9RwDOorTbPVG/IslTyhAQ8ZXcWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-HA6dnLvYPvKCXw5OgVE4Qw-1; Thu, 09 Sep 2021 05:58:55 -0400
X-MC-Unique: HA6dnLvYPvKCXw5OgVE4Qw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F9EB80006E;
	Thu,  9 Sep 2021 09:58:54 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7407100EBC1;
	Thu,  9 Sep 2021 09:58:53 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210830164626.tq5emfrht4o46x33@nitro.local>
References: <20210830164626.tq5emfrht4o46x33@nitro.local>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: dhowells@redhat.com, users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Date: Thu, 09 Sep 2021 10:58:52 +0100
Message-ID: <398626.1631181532@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dhowells@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <398625.1631181532.1@warthog.procyon.org.uk>

Hi Konstantin,

Would it be possible to get a search box on the front page into which you can
just drop a message ID and have it jump to the message, if present, kind of
like lore.kernel.org/r/<msg-id> does?

Thanks,
David

