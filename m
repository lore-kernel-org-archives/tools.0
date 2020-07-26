Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
 by mx.groups.io with SMTP id smtpd.web10.22824.1595734878187930902
 for <tools@linux.kernel.org>;
 Sat, 25 Jul 2020 20:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@kyleam.com header.s=mesmtp header.b=xZknDtHy;
 spf=pass (domain: kyleam.com, ip: 64.147.108.71, mailfrom: kyle@kyleam.com)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 0AE386AB05;
	Sat, 25 Jul 2020 23:41:17 -0400 (EDT)
	(envelope-from kyle@kyleam.com)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to
	:subject:date:message-id:mime-version:content-transfer-encoding;
	 s=sasl; bh=Gth3fM/z5pptH9FGdYPHkmVdj8E=; b=UV5NK7hi6s7aCOvRyWcB
	rskBRnGi27Lx7VxDC4B6SWIcpk7tCWWV2cAx1dh2sAT0sxGtp+Zkp7HmCe9KqXVl
	fGM7wYRxITL+aFiuCoHoV+OrsEHNBo7Nfi9dQMybm03HbZegxZcq5tP3iieyDE2C
	YQRkCfxKGF6C4/ojf/BHQRE=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id F2C6D6AB04;
	Sat, 25 Jul 2020 23:41:16 -0400 (EDT)
	(envelope-from kyle@kyleam.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=kyleam.com;
 h=from:to:subject:date:message-id:mime-version:content-transfer-encoding;
 s=mesmtp; bh=T6zV6AF25d5Sjy8Bn6hyf5J42WArG81+pdhz4i7eMSo=;
 b=xZknDtHyDRUpXy4BTnxfGpfMY74qzvZ6B56RsfBIve58pslwtyJrfmBHmG02MZg0Cv4MV6WBXW+djQDmlkmP6PJ/LqnVDT+uFeQuQKc91NKjub1fpC10YyxV6J7FEhWdJNEIphkhc38qcUdO6ZbBRP2y5YAUWkZMvxGd4e76AVc=
Received: from localhost (unknown [45.33.91.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 5DF7C6AB02;
	Sat, 25 Jul 2020 23:41:16 -0400 (EDT)
	(envelope-from kyle@kyleam.com)
From: kyle@kyleam.com
To: tools@linux.kernel.org
Subject: [PATCH b4 0/2] Two fixes for LoreMessage.get_body_parts()
Date: Sat, 25 Jul 2020 23:41:13 -0400
Message-Id: <20200726034115.21567-1-kyle@kyleam.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Pobox-Relay-ID: 
 DC23AB52-CEF1-11EA-AD88-2F5D23BA3BAF-24757444!pb-smtp2.pobox.com
Content-Transfer-Encoding: quoted-printable

After using 'b4 am' to grab a series from public-inbox meta [0], I
noticed that many of the commit message bodies were missing.  It turns
out that this happens when a message body consists of only a single,
non-trailer paragraph.

The second patch fixes this.  The first patch addresses another issue
I spotted when debugging the dropped commit messages.

[0]: https://public-inbox.org/meta/20200724055606.27332-1-e@yhbt.net


  [1/2] Fix basement detection for empty commit message bodies
  [2/2] Fix handling of single-paragraph commit message bodies

 b4/__init__.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)


base-commit: 2737ccdd3dbf58e330ace3ec658511bfbd715059
--=20
2.27.0

