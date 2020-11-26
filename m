Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.4115.1606392860037713140
 for <tools@linux.kernel.org>;
 Thu, 26 Nov 2020 04:14:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@kernel.org header.s=default header.b=EkOvUVHH;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: acme@kernel.org)
Received: from quaco.ghostprotocols.net (unknown [179.97.37.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1525C2087C;
	Thu, 26 Nov 2020 12:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606392859;
	bh=hv6se9OB23Q3gVwZDtOcCgbYvYe4y6IazWKWZI4dg1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EkOvUVHHw3ek5ir66QTOi8yZqPSbxXq9EhD6uZ5DDs4OZBStROflVUh6QP2GHPQNx
	 Le/F5d5r0v0Aolejg2S5qJ01VfdssC4vEG6Oqu/0cBy64DXSINXZAgEN27blPm1TFH
	 JMT0e0lao//e2luzeoL5GEs6SX8FlVtzeD1B2Prw=
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id EBE6C40E29; Thu, 26 Nov 2020 09:14:16 -0300 (-03)
Date: Thu, 26 Nov 2020 09:14:16 -0300
From: acme@kernel.org
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 Cc: lines
Message-ID: <20201126121416.GC53384@kernel.org>
References: <20201014164747.GM3100363@kernel.org>
 <20201124222756.osrv7ixjer6n3f3f@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20201124222756.osrv7ixjer6n3f3f@chatter.i7.local>
X-Url: http://acmel.wordpress.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Em Tue, Nov 24, 2020 at 05:27:56PM -0500, Konstantin Ryabitsev escreveu:
> On Wed, Oct 14, 2020 at 01:47:47PM -0300, Arnaldo Carvalho de Melo wrot=
e:
> > 	First of all, thanks a lot for b4, I'm now using it regularly,
> > great tool!

> > 	My previous workflow involved a 'am' script that I would have to
> > use patch by patch, would go on it and collect Cc: lines, not just th=
e
> > ones in the patch itself, but the ones in the e-mail containing it, a=
s I
> > wanted to record that that group of people was actually made aware of
> > that change.

> > 	Would it be possible to have something like a --cc to have that?
>=20
> I added this feature to the latest master, but I'm not 100% sure if it'=
s=20
> doing the right/useful thing. If we only look for Cc: addresses, then=20
> more often than not we just find mailing lists there:

I'm using b4 and going thru all the patches, to read them one last time
and do whatever adjustments to the cset logs, so I'll see how this goes
with --cc.

Thanks for adding this feature!

- Arnaldo
=20
> ----
> $ b4 am -o/tmp 20201124143848.874894-1-antonio.borneo@st.com --cc-trail=
ers
> Looking up https://lore.kernel.org/r/20201124143848.874894-1-antonio.bo=
rneo%40st.com
> Grabbing thread from lore.kernel.org/lkml
> Analyzing 12 messages in the thread
> Will use the latest revision: v2
> You can pick other revisions using the -vN flag
> ---
> Writing /tmp/v2_20201124_antonio_borneo_net_phy_realtek_read_actual_spe=
ed_on_rtl8211f_to_detect_downshift.mbx
>   =E2=9C=93 [PATCH v2] net: phy: realtek: read actual speed on rtl8211f=
 to detect downshift
>     + Cc: linuxarm@huawei.com
>     + Cc: Salil Mehta <salil.mehta@huawei.com>
>     + Cc: linux-stm32@st-md-mailman.stormreply.com
>     + Cc: linux-kernel@vger.kernel.org
>   ---
>   =E2=9C=93 Attestation-by: DKIM/st.com (From: antonio.borneo@st.com)
> ---
> Total patches: 1
> ---
>  Link: https://lore.kernel.org/r/20201124215932.885306-1-antonio.borneo=
@st.com
>  Base: 9bd2702d292cb7b565b09e949d30288ab7a26d51
>        git checkout -b v2_20201124_antonio_borneo_st_com 9bd2702d292cb7=
b565b09e949d30288ab7a26d51
>        git am /tmp/v2_20201124_antonio_borneo_net_phy_realtek_read_actu=
al_speed_on_rtl8211f_to_detect_downshift.mbx
> ----
>=20
> Is it better to look both in To: and Cc:, or did you specifically inten=
d=20
> to have just the Cc: header copied into the commit?
>=20
> I'm also a bit worried that on some patches the Cc trailer list ends up=
=20
> fairly huge. Is that expected and okay?
>=20
> -K
>=20
>=20

--=20

- Arnaldo
