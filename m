Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A174229CA;
	Fri, 16 Apr 2021 20:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id D574B12806BB;
	Fri, 16 Apr 2021 13:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1618606703;
	bh=HCakud3umYCvHd3hDfvMlLMssJoiFlIdCeXcHdvLQK0=;
	h=Message-ID:Subject:From:To:Date:From;
	b=TDwrbnmYXvvcAJKKbM16CcH0ixTZJe7d3b5+QJQ2+PIm3pJSWXzbyZkgNRcwIcLKH
	 dVh2yLrnrkeIPPt0YYJ/IOit28Dry93mnEidOaRR3zoCEVSAgLyxVymboWlmqX+vGh
	 Nvls3Ep1EmQJwnMotY3dHjIG63nSHdPl7Gd+KQuM=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KVTr3XgymL69; Fri, 16 Apr 2021 13:58:23 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 83CB112806B7;
	Fri, 16 Apr 2021 13:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1618606703;
	bh=HCakud3umYCvHd3hDfvMlLMssJoiFlIdCeXcHdvLQK0=;
	h=Message-ID:Subject:From:To:Date:From;
	b=TDwrbnmYXvvcAJKKbM16CcH0ixTZJe7d3b5+QJQ2+PIm3pJSWXzbyZkgNRcwIcLKH
	 dVh2yLrnrkeIPPt0YYJ/IOit28Dry93mnEidOaRR3zoCEVSAgLyxVymboWlmqX+vGh
	 Nvls3Ep1EmQJwnMotY3dHjIG63nSHdPl7Gd+KQuM=
Message-ID: <cd77ebe2e456cb80527d9634a5469254006528c5.camel@HansenPartnership.com>
Subject: Subscriber actions for migrating lists to lists.linux.dev
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: users@linux.kernel.org, tools@linux.kernel.org
Date: Fri, 16 Apr 2021 13:58:22 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

I'm fairly certain all I need to do is a bit of duplicate message
elimination and to update my procmail rules, but on the latter, what is
the header I should be sorting on?  For current kernel.org lists, it's
either X-Mailing-list: or List-ID:  Will it be the same for
lists.linux.dev (so I just add to the domain in the rule)?

Ordinarily I'd just wait and see, but given the volumes involved I
wasn't keen on waking up to hundreds of emails suddenly in my INBOX
instead of the list folders.

James


