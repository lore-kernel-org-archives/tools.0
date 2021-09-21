Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0993FC8
	for <tools@linux.kernel.org>; Tue, 21 Sep 2021 17:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=S4oPrmDen1Fnbc1Poi7x9rQnPbftx/lKG8T8XEmF+rI=; b=hylyynFu969rxoSwvkJOEuOPa6
	+cfuSJMAkh52kzXqOyzd7+BZ7W0eickOfHbjfOzwT0uOmjjrQ8zMIIHV7JnAF5mXhaJxXBBogWOYS
	0IDgHYbzvZ9X3XsmUAygjzENnS7GwYS9wKWoEw+oAIsaB7YcfBCLW5waL4ntoF5b9Kr3IKtMOuG1x
	h6YOD4OE9ovOsD/wiTMQo48OUs3t9McBRF/E7gRSl+YPhf/hqhGWpP7YkcWuzXh3eZFgwW4Llm+Jl
	HnuAl3eGT8q9qHmHCGBNs5N6+gNCVB2GtSEm0WzUh8BrNvN/clDTtlFuqbxalDmA4k7FwHwLn2MJA
	9JqR1Yfw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54712)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1mSjnE-0002ur-4n
	for tools@linux.kernel.org; Tue, 21 Sep 2021 18:42:56 +0100
Received: from rmk by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@shell.armlinux.org.uk>)
	id 1mSjnD-0003Qp-MV
	for tools@linux.kernel.org; Tue, 21 Sep 2021 18:42:55 +0100
Date: Tue, 21 Sep 2021 18:42:55 +0100
From: Russell King <rmk@armlinux.org.uk>
To: tools@linux.kernel.org
Subject: b4 - imap support?
Message-ID: <YUoZn+BTT7VPdZ3L@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King <rmk@armlinux.org.uk>

Hi Konstantin,

Years ago, I moved away from mbox files for receiving email to imap
with mutt, but from what I understand from your talk today, b4 doesn't
support imap. Am I wrong?

Nice talk, thanks!

Regards,
Russell.

-- 
Russell King
