Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6739E2FAF
	for <tools@linux.kernel.org>; Thu,  9 Sep 2021 13:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631195653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5m8Hrxe2NCB0vpYcfhAJz91rupSnmd3H0S1GlXweop8=;
	b=Mq1PiuXBEMVLhN7f2bWK68ZGlm87VJz19671TNU1BMudi4+TMuL6OntXN22xjaoT12qbqf
	cck6O1jsMJjSXQ10gO385BVtJ8FAWarOYnzSkMCoYvsePAecJVYFJGO7axP/Ugib4Xjd16
	XaoZmBeR66maZhiSdD72oh5wyloBQ3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-3DrRSFACPomLM5IsLul-dw-1; Thu, 09 Sep 2021 09:54:11 -0400
X-MC-Unique: 3DrRSFACPomLM5IsLul-dw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25553835E02;
	Thu,  9 Sep 2021 13:54:10 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0233026DFB;
	Thu,  9 Sep 2021 13:54:08 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210909123150.fgo7vma4i32t36mg@meerkat.local>
References: <20210909123150.fgo7vma4i32t36mg@meerkat.local> <20210830164626.tq5emfrht4o46x33@nitro.local> <398626.1631181532@warthog.procyon.org.uk>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: dhowells@redhat.com, users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Date: Thu, 09 Sep 2021 14:54:08 +0100
Message-ID: <515599.1631195648@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dhowells@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <515598.1631195648.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

>=20
> You can make it even easier.
>=20
> In Firefox:
>=20
>     * open bookmarks pane (Ctrl-b)
>     * right-click->add bookmark
>     * Name: lore mid, URL: https://lore.kernel.org/%s, Keyword: lore -> S=
ave
>=20
> In Chrome:
>=20
>     * Go to chrome://settings/searchEngines
>     * Click "Add" next to "Other search engines"
>     * Search engine: lore mid, Keyword: lore, URL: https://lore.kernel.or=
g/%s -> Add
>=20
> Now you can type "lore <message-id>" in the toolbar.

Cute... but IMO, that's not actually easier than just clicking on the lore
item in the bookmark strip, then pasting the message ID in the box and hitt=
ing
go.  Is it possible to add a separate lore-search box, I wonder?  I search
lore a lot.

You also have to strip the <...> yourself rather than lore doing it as it d=
oes
when you paste into the search box on the per-archive pages.

Actually, I guess I can just click on the "all" archive and do it there.

Btw, is there some ordering on the list of archives on the front page?  I'm
guessing it's in order of most recent addition.  Wouldn't alphabetic order =
be
more useful?

David

