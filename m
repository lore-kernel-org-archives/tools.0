Received: from albireo.enyo.de (albireo.enyo.de [37.24.231.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7322914;
	Mon, 12 Sep 2022 12:33:22 +0000 (UTC)
Received: from [172.17.203.2] (port=49805 helo=deneb.enyo.de)
	by albireo.enyo.de ([172.17.140.2]) with esmtps (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	id 1oXiXT-005cnz-5B; Mon, 12 Sep 2022 12:27:47 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.94.2)
	(envelope-from <fw@deneb.enyo.de>)
	id 1oXiXS-0006Jq-Qb; Mon, 12 Sep 2022 14:27:46 +0200
From: Florian Weimer <fw@deneb.enyo.de>
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
  users@linux.kernel.org,  tools@linux.kernel.org
Subject: Re: Resolver splat from b4 am
References: <Yx8kXFRXB0chuYkL@sirena.org.uk>
Date: Mon, 12 Sep 2022 14:27:46 +0200
In-Reply-To: <Yx8kXFRXB0chuYkL@sirena.org.uk> (Mark Brown's message of "Mon,
	12 Sep 2022 13:21:48 +0100")
Message-ID: <87illspykd.fsf@mid.deneb.enyo.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

* Mark Brown:

>     raise NoNameservers(request=self.request, errors=self.errors)
> dns.resolver.NoNameservers: All nameservers failed to answer the query 20210112._domainkey.quanta-corp-partner-google-com.20210112.gappssmtp.com. IN TXT: Server 172.16.32.1 UDP port 53 answered ; Server 172.16.32.1 TCP port 53 answered [Errno 111] Connection refused

This looks like missing TCP DNS service on your network.  The DNS
response is larger than 512 bytes, so it can't be transmitted over UDP.
